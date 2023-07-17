import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/common/face_detector_painter.dart';
import 'package:megamouth_front/logic/shutter_notifier.dart';
import 'package:megamouth_front/main.dart';
import 'package:megamouth_front/model/tweet.dart';

import '../common/image_utils.dart';

late List<CameraDescription> cameras;
late Rect boundingBox;

class CameraWidget extends ConsumerStatefulWidget {
  CameraWidget({super.key, required this.photoMode});

  bool photoMode;

  @override
  CameraWidgetState createState() => CameraWidgetState();
}

late CameraController controller;

class CameraWidgetState extends ConsumerState<CameraWidget> {
  bool isBusy = false;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );
  List<Widget> _tweets = [];
  late Size canvasSize;
  late CameraDescription camera;
  late CameraLensDirection direction;

  @override
  void initState() {
    super.initState();
    camera = widget.photoMode ? cameras[1] : cameras[0];
    direction = widget.photoMode
        ? CameraLensDirection.front
        : CameraLensDirection.front;
    controller = CameraController(
      camera,
      widget.photoMode ? ResolutionPreset.low : ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream(_processCameraImage);
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return CameraPreview(
      controller,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          canvasSize = Size(constraints.maxWidth, constraints.maxHeight);
          return Stack(
            children: _tweets,
          );
        },
      ),
    );
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;
    detector(inputImage, image);
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    // get camera rotation
    final camera = cameras[1];
    final sensorOrientation = camera.sensorOrientation;
    var rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    // print(
    //     'lensDirection: ${camera.lensDirection}, rotation: ${camera.sensorOrientation} [$rotation], ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[controller.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  Future<void> detector(InputImage inputImage, CameraImage cameraImage) async {
    if (isBusy) return;
    isBusy = true;
    var faces = await _faceDetector.processImage(inputImage);
    _tweets = [];
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      if (widget.photoMode && faces.isNotEmpty) {
        faces
            .sort((a, b) => b.boundingBox.width.compareTo(a.boundingBox.width));
        if (faces[0].headEulerAngleY != null) {
          shutterNotifier.setTiming(faces[0].headEulerAngleY!);
        }
        faces = [faces[0]];
      }
      for (Face face in faces) {
        if (widget.photoMode) {
          final conf = SpeechBubbleConf.fromFace(
            face,
            canvasSize,
            inputImage.metadata!.size,
            inputImage.metadata!.rotation,
            direction,
          );
          boundingBox = face.boundingBox;
          _tweets.addAll(
            [
              CustomPaint(
                painter: FaceDetectorPainter(conf, widget.photoMode),
              ),
            ],
          );
        } else {
          final image = convertImage(cameraImage);
          final croppedImage = copyCrop(
              image,
              (face.boundingBox.left * 0.3).floor(),
              (face.boundingBox.top * 0.3).floor(),
              (face.boundingBox.width * 2).ceil(),
              (face.boundingBox.height * 2).ceil());
          final base64 = base64Encode(encodeJpg(croppedImage));
          final body = {"image_base64": base64};
          final res = await ApiClient()
              .post(Uri.parse('grpc/stream'), json.encode(body), isNgrok: true);
          if (res.statusCode != 200) {
            logger.e('cannot identification');
            logger.e('StatusCode: ${res.statusCode}');
            logger.e('message: ${res.body}');
            logger.e('body: ${json.encode(body)}');
          } else {
            final tweet = Tweet.fromJson(
                (json.decode(res.body) as Map<String, dynamic>)['result']);
            if (tweet.id == 0) {
              logger.i('do not have content');
            }
            final conf = SpeechBubbleConf.fromFace(
              face,
              canvasSize,
              inputImage.metadata!.size,
              inputImage.metadata!.rotation,
              direction,
            );
            boundingBox = face.boundingBox;
            _tweets.addAll(
              [
                CustomPaint(
                  painter: FaceDetectorPainter(conf, widget.photoMode),
                ),
                Positioned(
                    left: conf.bubbleLeftBottom.dx + conf.width * 0.1,
                    top: conf.bubbleLeftBottom.dy -
                        conf.height +
                        conf.height * 0.1,
                    width: conf.width - conf.width * 0.1,
                    height: conf.height - conf.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${tweet.author}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          tweet.content,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ))
              ],
            );
          }
        }
      }
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
