import 'package:app_test/views/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:app_test/binding/login_binding.dart';
import 'package:app_test/binding/main_page_binding.dart';
import 'package:app_test/views/login_page.dart';

appRoutes() => [
  GetPage(
    name: '/mainPage',
    page: () => MainPage(),
    transition: Transition.leftToRightWithFade,
    binding: MainPageBinding(),
    transitionDuration: const Duration(milliseconds: 500),
  ),

  GetPage(
    name: '/loginPage',
    page: () => LoginPage(),
    middlewares: [MyMiddelware()],
    binding: LoginPageBinding(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),

];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}