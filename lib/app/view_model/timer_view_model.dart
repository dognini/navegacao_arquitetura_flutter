import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  bool isPlayning = false;

  Timer? timer;
  Duration duration = Duration.zero;

  void startTimer(int initialMinutes, ValueNotifier<bool> isPause) {
    duration = Duration.zero;
    isPlayning = true;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPause.value) return;

      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    isPlayning = false;
    timer?.cancel();
    notifyListeners();
  }
}
