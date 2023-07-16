import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:megamouth_front/widget/camera.dart';

class TakePicture extends StatelessWidget {
  const TakePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CameraWidget(
          photoMode: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await controller.takePicture();
          final originalImage =
              decodeImage((File(image.path).readAsBytesSync()));

          final croppedImage = copyCrop(originalImage!,
              x: (boundingBox.left * 0.6).floor(),
              y: (boundingBox.top * 0.6).floor(),
              width: (boundingBox.width * 1.6).ceil(),
              height: (boundingBox.height * 1.6).ceil());
          File(image.path).writeAsBytesSync(encodeJpg(croppedImage));
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop(image.path);
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
