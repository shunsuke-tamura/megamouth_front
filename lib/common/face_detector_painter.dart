import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'coordinates_translator.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(
    this.conf,
  ) {
    width = conf.width;
    height = conf.height;
    pinHeight = conf.pinHeight;
    pinWidth = conf.pinWidth;
    faceBubbleMargine = conf.faceBubbleMargine;
    bubbleLeftBottom = conf.bubbleLeftBottom;
    bubbleEdgeDiameter = conf.bubbleEdgeDiameter;
  }

  final SpeechBubbleConf conf;

  late double width;
  late double height;
  late double pinHeight;
  late double pinWidth;
  late double faceBubbleMargine;
  late Offset bubbleLeftBottom;
  late double bubbleEdgeDiameter;

  @override
  void paint(Canvas canvas, Size size) {
    void speechBubble() {
      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(bubbleLeftBottom.dx, bubbleLeftBottom.dy)
        ..lineTo(bubbleLeftBottom.dx + width - bubbleEdgeDiameter,
            bubbleLeftBottom.dy)
        ..quadraticBezierTo(
            bubbleLeftBottom.dx + width,
            bubbleLeftBottom.dy,
            bubbleLeftBottom.dx + width,
            bubbleLeftBottom.dy - bubbleEdgeDiameter)
        ..lineTo(bubbleLeftBottom.dx + width,
            bubbleLeftBottom.dy - height + bubbleEdgeDiameter)
        ..quadraticBezierTo(
            bubbleLeftBottom.dx + width,
            bubbleLeftBottom.dy - height,
            bubbleLeftBottom.dx + width - bubbleEdgeDiameter,
            bubbleLeftBottom.dy - height)
        ..lineTo(bubbleLeftBottom.dx + bubbleEdgeDiameter,
            bubbleLeftBottom.dy - height)
        ..quadraticBezierTo(
            bubbleLeftBottom.dx,
            bubbleLeftBottom.dy - height,
            bubbleLeftBottom.dx,
            bubbleLeftBottom.dy - height + bubbleEdgeDiameter)
        ..lineTo(bubbleLeftBottom.dx, bubbleLeftBottom.dy - bubbleEdgeDiameter)
        ..quadraticBezierTo(bubbleLeftBottom.dx, bubbleLeftBottom.dy,
            bubbleLeftBottom.dx + bubbleEdgeDiameter, bubbleLeftBottom.dy)
        // pin
        ..moveTo(
            bubbleLeftBottom.dx + width / 2 - pinWidth / 2, bubbleLeftBottom.dy)
        ..lineTo(
            bubbleLeftBottom.dx + width / 2, bubbleLeftBottom.dy + pinHeight)
        ..lineTo(bubbleLeftBottom.dx + width / 2 + pinWidth / 2,
            bubbleLeftBottom.dy);

      canvas.drawPath(path, paint);
    }

    // print('-------canvas--------');
    // print(size.width);
    // print(size.height);
    // print('---------------------');

    speechBubble();
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.conf.bubbleLeftBottom != conf.bubbleLeftBottom;
  }
}

class SpeechBubbleConf {
  double width;
  double height;
  double pinHeight;
  double pinWidth;
  double faceBubbleMargine;
  Offset bubbleLeftBottom;
  double bubbleEdgeDiameter;

  SpeechBubbleConf(
    this.bubbleEdgeDiameter,
    this.bubbleLeftBottom,
    this.faceBubbleMargine,
    this.height,
    this.pinHeight,
    this.pinWidth,
    this.width,
  );

  static SpeechBubbleConf fromFace(Face face, Size canvasSize, Size imageSize,
      InputImageRotation rotation, CameraLensDirection cameraLensDirection) {
    final left = translateX(
      face.boundingBox.left,
      canvasSize,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    final top = translateY(
      face.boundingBox.top,
      canvasSize,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    final right = translateX(
      face.boundingBox.right,
      canvasSize,
      imageSize,
      rotation,
      cameraLensDirection,
    );

    final faceWidth = right - left;
    final faceLeftTop = Offset(left, top);

    final width = faceWidth * 1.2;
    final height = width * 0.5;
    final pinHeight = height * 0.3;
    final pinWidth = pinHeight;
    final faceBubbleMargine = width * 0.2;
    final bubbleLeftBottom = Offset(
      (faceLeftTop.dx + faceWidth / 2) - width / 2,
      faceLeftTop.dy - pinHeight - faceBubbleMargine,
    );
    final bubbleEdgeDiameter = width * 0.1;

    return SpeechBubbleConf(bubbleEdgeDiameter, bubbleLeftBottom,
        faceBubbleMargine, height, pinHeight, pinWidth, width);
  }
}
