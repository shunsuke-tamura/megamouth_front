import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

final ShutterNotifier shutterNotifier = ShutterNotifier();

class ShutterNotifier {
  final ValueNotifier<bool> timing = ValueNotifier(false);
  final ValueNotifier<int> type = ValueNotifier(0);

  void setType(int t) {
    type.value = t;
  }

  void setTiming(double angle) {
    switch (type.value) {
      case 1:
        if (50 >= angle && angle >= 40 && !timing.value) {
          Vibrate.feedback(FeedbackType.heavy);
          Future.delayed(const Duration(seconds: 1), () {
            timing.value = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            timing.value = false;
          });
        }
        break;
      case 2:
        if (5 >= angle && angle >= -5 && !timing.value) {
          Vibrate.feedback(FeedbackType.heavy);
          Future.delayed(const Duration(seconds: 1), () {
            timing.value = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            timing.value = false;
          });
        }
        break;
      case 3:
        if (-40 >= angle && angle >= -50 && !timing.value) {
          Vibrate.feedback(FeedbackType.heavy);
          Future.delayed(const Duration(seconds: 1), () {
            timing.value = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            timing.value = false;
          });
        }
        break;
    }
  }
}
