import 'package:get/get.dart';

import '../controller/login_page_controller.dart';
// import 'package:mini_dictionary/controller/definition_page_controller.dart';

class LoginPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginPageController());
  }

}