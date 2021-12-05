import 'dart:async';

import 'package:flutter/material.dart';

class Movement with ChangeNotifier {
  //Initial position values of the Mario
  double _mushroom = 1.3;
  double get mushroom => _mushroom;
  double _marioX = -0.7;
  double get marioX => _marioX;
  double _marioY = 1;
  double get marioY => _marioY;
  bool _run = false;
  bool get run => _run;
  bool _isJump = false;
  bool get isJump => _isJump;
  bool _buttonPressed = false;
  bool get buttonPressed => _buttonPressed;
  int _level = 1;
  int get level => _level;
  int _stop = 1;
  int get stop => _stop;
  double _moneyY = 0.4;
  double get moneyY => _moneyY;
  double height = 0;
  double initialHeight = 1;
  double time = 0;
  double initialRun = -0.4;

  void moveForward() {
    if (_stop == 4 || _stop == 9) {
      initialRun = 1.2;
    }
    if (_stop == 5) {
      initialRun = -0.5;
    }
    if (_stop == 8) {
      initialRun = 0;
    }
    if (_stop == 12) {
      initialRun = 0.6;
    }
    _stop = _stop + 1;
    // enables to move the mario forward
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_marioX < initialRun) {
        _buttonPressed = true;
        _marioX += 0.02;
        _run = !_run;
        notifyListeners();
      }

      if (_marioX == initialRun || _marioX > initialRun) {
        _buttonPressed = false;
        timer.cancel();
        notifyListeners();
        if (_marioX > 1) {
          _marioX = -0.9;
          notifyListeners();
          _level = _level + 1;
        }
      }
    });
  }

  void jump() {
    _stop = _stop + 1;
    height = 0;
    initialHeight = 1;
    time = 0;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        _marioY = 1;
        _buttonPressed = false;
        _isJump = false;
        timer.cancel();
        notifyListeners();
        timer.cancel();
      } else {
        _buttonPressed = true;
        _isJump = true;
        _marioY = initialHeight - height;
        _marioX += 0.03;
        notifyListeners();
      }
    });
  }

  void linerJump() {
    height = 0;
    initialHeight = 1.2;
    time = 0;
    _stop = _stop + 1;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        _marioY = 1;
        _buttonPressed = false;
        _isJump = false;
        timer.cancel();
        notifyListeners();
        timer.cancel();
      } else if (initialHeight - height < 0.3 + 0.3 &&
          initialHeight - height > 0.3 - 0.2 &&
          time < 0.5 &&
          (marioX + 0.5).abs() < 0.05) {
        timer.cancel();

        // money
        if (_stop == 7) {
          Timer.periodic(const Duration(milliseconds: 50), (timer) {
            _moneyY -= 0.1;
            notifyListeners();
            if (moneyY < -1.5) {
              timer.cancel();
              notifyListeners();
            }
          });
        }
        Timer.periodic(const Duration(milliseconds: 50), (timer) {
          _marioY += 0.05;
          notifyListeners();

          if (marioY > 1) {
            _marioY = 1;
            _buttonPressed = false;
            _isJump = false;
            timer.cancel();
            notifyListeners();
          }
        });
        notifyListeners();
      } else {
        _buttonPressed = true;
        _isJump = true;
        _marioY = initialHeight - height;

        notifyListeners();
      }
    });
  }

  void mushroomMovement() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _mushroom = _mushroom - 0.05;
      notifyListeners();
      if (_mushroom <= 0) {
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void counter() {
    _stop = _stop + 1;
    notifyListeners();
  }
}
