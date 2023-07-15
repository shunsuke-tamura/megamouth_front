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
    void text(String text, Size bubbleSize, Offset leftBottom) {
      final fontSize = bubbleSize.width * 0.1;
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize,
      );
      final textSpan = TextSpan(
        text: text,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: bubbleSize.width - 16,
      );
      final offset =
          Offset(leftBottom.dx + 8, leftBottom.dy - bubbleSize.height + 30);
      textPainter.paint(canvas, offset);
    }

    void speechBubble(double faceWidth, Offset faceLeftTop) {
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
      text('text', Size(width, height),
          Offset(bubbleLeftBottom.dx, bubbleLeftBottom.dy - pinHeight));
    }

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

      // canvas.drawRect(
      //   Rect.fromLTRB(left, top, right, bottom),
      //   paint1,
      // );
      speechBubble(right - left, Offset(left, top));
    }
    // speechBubble(150, const Offset(100, 200));
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }
}
