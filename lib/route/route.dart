import 'package:app_test/views/main_page.dart';
import 'package:get/get.dart';

import '../binding/login_binding.dart';
import '../binding/main_page_binding.dart';
import '../views/admin_panel.dart';
import '../views/login_page.dart';

appRoutes() => [
  GetPage(
    name: '/mainPage',
    page: () => MainPage(),
    transition: Transition.leftToRightWithFade,
    binding: MainPageBinding(),
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/adminPanel',
    page: () => AdminPanelPage(),
    middlewares: [MyMiddelware()],
    // binding: DefinitionBinding(),
    transition: Transition.leftToRightWithFade,
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
    print(page?.name);
    return super.onPageCalled(page);
  }
}