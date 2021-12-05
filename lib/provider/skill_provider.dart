import 'dart:async';
import 'package:flutter/material.dart';

class Skills with ChangeNotifier {
  bool _isCastle = false;
  bool get isCatle => _isCastle;
  double _flame = 0.6;
  double get flame => _flame;
  double _fire = 1.2;
  double get fire => _fire;
  bool _textShown = false;
  bool get textShowm => _textShown;
  double _skillY = 1.7;
  double get skillY => _skillY;
  int _index = 0;
  int get index => _index;
  final List<String> _skillSets = [
    '',
    'J a v a - 100 pts',
    'Dart and Flutter - 90 pts',
    'FireBase - 90 pts',
    'QA Testing - 85 pts',
    'Engineering Degree Acquired',
    'Spanish B2 leveled up',
    'Football Fan - just an info :)',
    'MBA Degree Acquired',
    'BlocX and Provider skills Acquired',
    'Cognizant - 2 Years Exp points - Programmer Analyst',
    'Digital App Marketer - SEO/ASO exp Gained',
    'Survived Pandemic haha'
  ];

  List get skillSets {
    return _skillSets;
  }

  void skillUpdation() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _textShown = true;
      _skillY -= 0.065;
      notifyListeners();
      if (_skillY < -1.7) {
        timer.cancel();
        _skillY = 1.7;
        _textShown = false;

        notifyListeners();
      }
    });
    _index = _index + 1;
    notifyListeners();
  }

  void flameMovement() {
    _textShown = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _flame = _flame - 0.05;
      _textShown = true;
      notifyListeners();
      if (_flame <= -1.2) {
        timer.cancel();
        notifyListeners();
        _textShown = false;
      }
    });
  }

  void fireMovement() {
    _fire = -0.7;
    _textShown = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _fire = _fire + 0.05;
      _textShown = true;
      notifyListeners();
      if (_fire >= 0.7) {
        timer.cancel();
        _fire = 1.4;
        _isCastle = true;
        notifyListeners();
        _textShown = false;
      }
    });
    notifyListeners();
  }
}
