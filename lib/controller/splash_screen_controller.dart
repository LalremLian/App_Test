import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {

  final localStorage = GetStorage();
  bool? isFirstLaunch;

  Future<void> onBoarding() async {

    isFirstLaunch = localStorage.read('ISON');

    print('Token:::  ' + localStorage.read('USER_TOKEN').toString());
    print('ISON:::  ' + localStorage.read('ISON').toString());
    Future.delayed(const Duration(milliseconds: 1500), () {

      if(isFirstLaunch == true)
      {
        print('TRUE -- MainPage');
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.offNamed("/mainPage");
        });
      }
      else
      {
        print('FALSE -- LoginPage');
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.offNamed("/loginPage");
        });
      }

    });


    // print('SP :: ' + localStorage.read('ISON').toString());

  }


}