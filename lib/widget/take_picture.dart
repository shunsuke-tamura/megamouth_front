import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/widget/camera.dart';

class TakePicture extends ConsumerStatefulWidget {
  const TakePicture({super.key});

  @override
  TakePictureState createState() => TakePictureState();
}

class TakePictureState extends ConsumerState {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[1], ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _controller.takePicture();
          print(image.path);
          if (!mounted) return;
          Navigator.of(context).pop(image.path);
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
