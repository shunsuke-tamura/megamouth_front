import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'coordinates_translator.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(
    this.faces,
    this.imageSize,
    this.rotation,
    this.cameraLensDirection,
  );

  final List<Face> faces;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;

    for (final Face face in faces) {
      final left = translateX(
        face.boundingBox.left,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final top = translateY(
        face.boundingBox.top,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final right = translateX(
        face.boundingBox.right,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final bottom = translateY(
        face.boundingBox.bottom,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );

      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        paint1,
      );
    }

    void speechBubble(double faceWidth, Position faceLeftTop) {
      final width = faceWidth * 1.2;
      final height = width * 0.5;
      final pinHeight = height * 0.3;
      final pinWidth = pinHeight;
      final bubbleLeftBottom = Position(
          (faceLeftTop.x + faceWidth / 2) - width / 2,
          faceLeftTop.y - pinHeight);
      final bubbleEdgeDiameter = width * 0.1;

      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(bubbleLeftBottom.x, bubbleLeftBottom.y)
        ..lineTo(
            bubbleLeftBottom.x + width - bubbleEdgeDiameter, bubbleLeftBottom.y)
        ..quadraticBezierTo(bubbleLeftBottom.x + width, bubbleLeftBottom.y,
            bubbleLeftBottom.x + width, bubbleLeftBottom.y - bubbleEdgeDiameter)
        ..lineTo(bubbleLeftBottom.x + width,
            bubbleLeftBottom.y - height + bubbleEdgeDiameter)
        ..quadraticBezierTo(
            bubbleLeftBottom.x + width,
            bubbleLeftBottom.y - height,
            bubbleLeftBottom.x + width - bubbleEdgeDiameter,
            bubbleLeftBottom.y - height)
        ..lineTo(bubbleLeftBottom.x + bubbleEdgeDiameter,
            bubbleLeftBottom.y - height)
        ..quadraticBezierTo(
            bubbleLeftBottom.x,
            bubbleLeftBottom.y - height,
            bubbleLeftBottom.x,
            bubbleLeftBottom.y - height + bubbleEdgeDiameter)
        ..lineTo(bubbleLeftBottom.x, bubbleLeftBottom.y - bubbleEdgeDiameter)
        ..quadraticBezierTo(bubbleLeftBottom.x, bubbleLeftBottom.y,
            bubbleLeftBottom.x + bubbleEdgeDiameter, bubbleLeftBottom.y)
        // pin
        ..moveTo(
            bubbleLeftBottom.x + width / 2 - pinWidth / 2, bubbleLeftBottom.y)
        ..lineTo(bubbleLeftBottom.x + width / 2, bubbleLeftBottom.y + pinHeight)
        ..lineTo(
            bubbleLeftBottom.x + width / 2 + pinWidth / 2, bubbleLeftBottom.y);

      canvas.drawPath(path, paint);
    }

    speechBubble(100, Position(200, 200));
    speechBubble(300, Position(20, 150));
    speechBubble(40, Position(100, 400));
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }
}

class Position {
  double x;
  double y;
  Position(this.x, this.y);
}
