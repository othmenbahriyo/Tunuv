import 'dart:async';

import 'package:admin/Utils/PrefUtils.dart';
import 'package:admin/pages/home/presentation/views/home_view.dart';
import 'package:admin/pages/ouverture/login/presentation/views/login_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  PrefUtils prefUtils = new PrefUtils();

  startTime(goto) async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, goto);
  }

  void goToLogin() {
    Get.to(LoginView());
  }

  void goToHome() {
    Get.to(HomeView());
  }

  Future isAutheticated() async {
    //prefUtils.getUserToken().then((value) => print("value $value"));
    var isToken = prefUtils.getUserToken();
    print("istoken $isToken");
    if(isToken != "null" && isToken != "") {
      startTime(goToHome);
    }
    else {
      startTime(goToLogin);
    }
  }

  @override
  void onInit() async {
    await prefUtils.init();
    isAutheticated();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

}
