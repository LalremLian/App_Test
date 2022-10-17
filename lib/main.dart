import 'package:app_test/route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null) ? false : prefs.getBool('isLoggedIn');

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App Test',
    initialRoute: isLoggedIn! ? '/mainPage' : '/loginPage',
    getPages: appRoutes(),
  ));
}
