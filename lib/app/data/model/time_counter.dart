class TimeCounter {
  DateTime start = DateTime.now();
  DateTime? end;

  bool _isRunning = false;
  bool get timerStarted {
    return _isRunning;
  }

  int? _hour;
  String get hour {
    if (_hour == null && _isRunning == false) return '00';
    return _hour.toString().padLeft(2, '0');
  }

  int? _minute;
  String get minute {
    if (_minute == null && _isRunning == false) return '00';
    return _minute.toString().padLeft(2, '0');
  }

  int? _second;
  String get second {
    if (_second == null && _isRunning == false) return '00';
    return _second.toString().padLeft(2, '0');
  }

  void calculateElapsedTime() {
    try {
      Duration duration = DateTime.now().difference(start);
      print(duration.toString());
      String durationText =
          duration.toString().split('.').first.padLeft(8, '0');
      _hour = (int.parse(durationText.split(':')[0]));
      _minute = (int.parse(durationText.split(':')[1]));
      _second = (int.parse(durationText.split(':')[2]));
    } catch (e) {
      print('[calculateElapsedTime]\n${e.toString()}');
    }
  }

  reset(bool flag) {
    start = DateTime.now();
    end = null;
    _hour = 0;
    _minute = 0;
    _second = 0;
    _isRunning = flag;
  }
}
