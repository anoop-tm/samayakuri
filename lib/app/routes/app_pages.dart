import 'package:get/get.dart';

import 'package:samayakuri/app/modules/home/home_binding.dart';
import 'package:samayakuri/app/modules/home/home_view.dart';
import 'package:samayakuri/app/modules/project/project_binding.dart';
import 'package:samayakuri/app/modules/project/project_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => ProjectView(),
      binding: ProjectBinding(),
    ),
  ];
}
