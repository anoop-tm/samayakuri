import 'package:get/get.dart';
import 'package:samayakuri/app/data/model/time_counter.dart';

class HomeController extends GetxController {
  final timeCounter = TimeCounter().obs;

  @override
  void onInit() {
    super.onInit();

    interval(timeCounter, (_) => {print("$_ has been changed")});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onStartClicked() {
    timeCounter.value.reset(true);
  }
}
