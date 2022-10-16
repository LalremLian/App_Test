import 'package:app_test/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  final splashScreenController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    splashScreenController.onBoarding();
    return Scaffold(
      appBar: AppBar(
      title: Text("Hellow"),
    ));
  }
}
