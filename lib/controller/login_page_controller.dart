import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

import '../service/remote_services.dart';

// import 'package:e_court/general_certificate_court/services/login_page_api_service/login_page_api_service.dart';

// import 'package:e_court/general_certificate_court/pages/signup_page/view/signup_page.dart';

// import 'package:e_court/general_certificate_court/pages/dashboard_tab/dashboard_tab.dart';

// import '../../cdap_login_page/view/cdap_login_page.dart';



class LoginPageController extends GetxController {
  var isLoading = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  final localStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    emailController = TextEditingController(text: "admin@gmail.com");
    passwordController = TextEditingController(text: "12345678");

  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    print(email + '   ' + password);
    test(email, password);
  }

  Future<void> test(String e, String p) async {
    var respose = await RemoteService().getSearchData(e, p);

    var decodeJson = convert.jsonDecode(respose.body);

    print(decodeJson);
    print(respose);
    try {
      if (decodeJson['status'] != 0) {
        Get.snackbar(
          'Welcome',
          "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          forwardAnimationCurve: Curves.easeOutBack,
        );

        localStorage.write('USER_TOKEN', decodeJson['data']['token'].toString());
        print(localStorage.read('USER_TOKEN') + '    *********');

        Get.offAllNamed('/mainPage');
        // Get.to(() => DashboardTab());
      } else {
        Get.snackbar(
          decodeJson['data'],
          "",
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } finally {
      isLoading(false);
    }

  }


  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value))
    // if (value!=null)
    {
      return "Provide valid Email";
      // return "Email is empty";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

}