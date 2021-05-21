import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              heightFactor: .3,
            ),
          ),
          Text(
            'Samayakuri',
            style: Get.textTheme.headline4?.copyWith(fontFamily: 'MeriendaOne'),
          ),
          SizedBox(height: 100),
          Text('Start task', style: Get.textTheme.headline6),
          SizedBox(height: 20),
          _Timer(),
          SizedBox(height: 20),
          _Buttons(controller: controller),
          SizedBox(height: 20),
          Obx(
            () => (controller.lastElapsedTime.isEmpty)
                ? SizedBox(height: 10)
                : Text(
                    'Last time recorded was',
                    style: Get.textTheme.bodyText1,
                  ),
          ),
          Obx(
            () => Text(
              controller.lastElapsedTime.value,
              style: Get.textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            controller.onStartClicked();
          },
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.pause_rounded),
          label: Text('Pause'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            controller.onStopClicked();
          },
          icon: Icon(Icons.stop_rounded),
          label: Text('Stop'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}

class _Timer extends StatelessWidget {
  _Timer({
    Key? key,
  }) : super(key: key);

  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(_controller.elapsedTime.value, style: Get.textTheme.headline2),
    );
  }
}
