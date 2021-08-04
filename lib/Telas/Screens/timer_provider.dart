// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  int _hora = 0;
  int _min = 0;
  int _segundos = 0;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _continueEnable = false;

  int get hour => _hora;
  int get minute => _min;
  int get seconds => _segundos;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;

  void startTimer() {
    _hora = 0;
    _min = 0;
    _segundos = 0;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_segundos < 59) {
        _segundos++;
      } else if (_segundos == 59) {
        _segundos++;
        if (_min == 59) {
          _hora++;
          _min = 0;
        } else {
          _min++;
        }
      }

      notifyListeners();
    });
  }

  void stopTimer() {
    if (_startEnable == false) {
      _startEnable == true;
      _continueEnable == true;
      _stopEnable == false;
      _timer.cancel();
    }
    notifyListeners();
  }

  void continueTimer() {
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_segundos < 59) {
        _segundos++;
      } else if (_segundos == 59) {
        _segundos++;
        if (_min == 59) {
          _hora++;
          _min = 0;
        } else {
          _min++;
        }
      }

      notifyListeners();
    });
  }
}
