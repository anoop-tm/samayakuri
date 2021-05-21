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
          Text('00:00:20', style: Get.textTheme.headline2),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
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
                onPressed: () {},
                icon: Icon(Icons.stop_rounded),
                label: Text('Stop'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
