import 'package:get/get.dart';

import 'package:sample_project/app/modules/home/bindings/home_binding.dart';
import 'package:sample_project/app/modules/home/views/home_view.dart';
import 'package:sample_project/app/modules/main_page/bindings/main_page_binding.dart';
import 'package:sample_project/app/modules/main_page/views/main_page_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
  ];
}
