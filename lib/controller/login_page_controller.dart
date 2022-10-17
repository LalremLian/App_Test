import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';
import '../service/remote_services.dart';


class LoginPageController extends GetxController {
  var isLoading = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';


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
    isLoading(true);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var respose = await RemoteService().getLoginData(e, p);

    var decodeJson = convert.jsonDecode(respose.body);

    try {
      if (decodeJson['status'] != 0) {
        prefs.setBool('isLoggedIn', true);
        Get.snackbar(
          'Welcome',
          "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          forwardAnimationCurve: Curves.easeOutBack,
        );

        prefs.setString('USER_TOKEN', decodeJson['data']['token'].toString());

        Get.offAllNamed('/mainPage');
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