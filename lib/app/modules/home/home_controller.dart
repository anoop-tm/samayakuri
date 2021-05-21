import 'dart:async';
import 'package:get/get.dart';
import 'package:samayakuri/app/data/provider/counter.dart';

class HomeController extends GetxController {
  final elapsedTime = '00:00:00'.obs;
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
          Duration duration = DateTime.now().difference(startTime!);
          elapsedTime(
            duration.toString().split('.').first.padLeft(8, "0"),
          );
        });
      } else {
        timer?.cancel();
      }
    });

    _checkIfTimeIsSaved();
    _initTimerIfTimeIsSaved();
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
    lastElapsedTime(elapsedTime.value);
    elapsedTime('00:00:00');
    isRunning(false);
    timer?.cancel();
    _sharedPref.clearDuration();
  }

  bool _checkIfTimeIsSaved() {
    DateTime? savedTime = _sharedPref.getDuration();
    if (savedTime == null) {
      return false;
    } else {
      startTime = savedTime;
      isRunning(true);
      return true;
    }
  }

  void _initTimerIfTimeIsSaved() {}
}
