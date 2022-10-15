import 'package:app_test/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Test',
      initialRoute: '/loginPage',
      getPages: appRoutes(),
    );
  }
}