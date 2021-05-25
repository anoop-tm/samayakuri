import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:samayakuri/app/modules/home/home_controller.dart';

class MockHomeController extends Mock implements HomeController {}

void main() {
  setUp(() {
    Get.put(HomeController());
  });

  group('HomeController', () {
    test("convertTimeToDecimal: 1m", () async {
      HomeController controller = Get.find();
      Duration duration = Duration(hours: 0, minutes: 1, seconds: 0);
      controller.convertTimeToDecimal(duration);
      expect(controller.elapsedTimeInDecimal.value, 0.2);
    });

    test("convertTimeToDecimal: 45mins", () async {
      HomeController controller = Get.find();
      Duration duration = Duration(hours: 0, minutes: 45, seconds: 0);
      controller.convertTimeToDecimal(duration);
      expect(controller.elapsedTimeInDecimal.value, 0.75);
    });

    test("convertTimeToDecimal: 1h", () async {
      HomeController controller = Get.find();
      Duration duration = Duration(hours: 1, minutes: 00, seconds: 0);
      controller.convertTimeToDecimal(duration);
      expect(controller.elapsedTimeInDecimal.value, 1.0);
    });

    test("convertTimeToDecimal: 2h 15m", () async {
      HomeController controller = Get.find();
      Duration duration = Duration(hours: 2, minutes: 15, seconds: 0);
      controller.convertTimeToDecimal(duration);
      expect(controller.elapsedTimeInDecimal.value, 2.25);
    });

    test("convertTimeToDecimal: 3h 30m", () async {
      HomeController controller = Get.find();
      Duration duration = Duration(hours: 3, minutes: 30, seconds: 0);
      controller.convertTimeToDecimal(duration);
      expect(controller.elapsedTimeInDecimal.value, 3.5);
    });
  });
}
