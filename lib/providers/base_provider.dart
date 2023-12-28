// import 'package:algorithms_visualizer/utils/wait.dart';
import 'package:flutter/material.dart';

import '../utiles/wait.dart';

abstract class BaseProvider extends ChangeNotifier {
  double _executionSpeed = 0.1;
  double get executionSpeed => _executionSpeed;
  set executionSpeed(double speed) {
    if (speed > 50.0) {
      _executionSpeed = 50.0;
    } else if (speed < 0) {
      _executionSpeed = 0;
    } else {
      _executionSpeed = speed;
    }
    render();
  }

  @protected
  void render() {
    notifyListeners();
  }

  @protected
  Future pause() async {
    await wait(speed: executionSpeed);
  }
}
