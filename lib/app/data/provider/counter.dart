import 'package:shared_preferences/shared_preferences.dart';

class CounterSqlClient {}

class CounterSharedPref {
  late SharedPreferences _prefs;

  CounterSharedPref._();

  static Future<CounterSharedPref> create() async {
    CounterSharedPref instance = CounterSharedPref._();
    await instance.initPrefs();
    return instance;
  }

  Future<void> initPrefs() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      throw e.toString();
    }
  }

  saveDuration(DateTime dateTime) {
    _prefs.setInt('startTime', dateTime.millisecondsSinceEpoch);
  }

  DateTime? getDuration() {
    int? millisecondsSinceEpoch = _prefs.getInt('startTime');
    if (millisecondsSinceEpoch == null)
      return null;
    else
      return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  clearDuration() {
    _prefs.clear();
  }
}
