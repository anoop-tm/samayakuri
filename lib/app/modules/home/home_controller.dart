import 'dart:async';
import 'package:get/get.dart';
import 'package:samayakuri/app/data/provider/counter.dart';

class HomeController extends GetxController {
  Duration elapsedTime = Duration();
  final elapsedTimeText = '00:00:00'.obs;
  final elapsedTimeInDecimal = 0.0.obs;
  final lastElapsedTime = ''.obs;
  final isRunning = false.obs;

  Timer? timer;
  DateTime? startTime = null;
  late CounterSharedPref _sharedPref;

  @override
  void onInit() async {
    super.onInit();

    _sharedPref = await CounterSharedPref.create();

    ever(isRunning, (value) {
      if (isRunning.isTrue) {
        timer = Timer.periodic(Duration(seconds: 1), (value) {
          elapsedTime = DateTime.now().difference(startTime!);
          elapsedTimeText(
            elapsedTime.toString().split('.').first.padLeft(8, "0"),
          );
        });
      } else {
        timer?.cancel();
      }
    });

    initTimerIfTimeisSaved();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onStartClicked() {
    startTime = DateTime.now();
    _sharedPref.saveDuration(startTime!);
    isRunning(true);
  }

  onPauseClicked() {}

  onStopClicked() {
    lastElapsedTime(elapsedTimeText.value);
    convertTimeToDecimal(elapsedTime);
    elapsedTime = Duration();
    elapsedTimeText('00:00:00');
    isRunning(false);
    timer?.cancel();
    _sharedPref.clearDuration();
  }

  bool initTimerIfTimeisSaved() {
    DateTime? savedTime = _sharedPref.getDuration();
    if (savedTime == null) {
      return false;
    } else {
      startTime = savedTime;
      isRunning(true);
      return true;
    }
  }

  void convertTimeToDecimal(Duration duration) {
    num hours = num.parse(duration.toString().split(':').first);
    num minutes = num.parse(duration.toString().split(':')[1]);
    num decimal = (minutes / 60 * 100).round();
    num result = num.parse('$hours.${decimal.toString().replaceAll('.', '')}');
    elapsedTimeInDecimal(result.toDouble());
  }
}
