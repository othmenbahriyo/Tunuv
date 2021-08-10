import 'dart:convert';

import 'package:admin/Utils/PrefUtils.dart';
import 'package:admin/component/Loader.dart';
import 'package:admin/constant/constant.dart';
import 'package:admin/pages/home/presentation/views/home_view.dart';
import 'package:admin/pages/ouverture/login/data/login_api_provider.dart';
import 'package:admin/pages/ouverture/login/presentation/views/login_view.dart';
import 'package:admin/pages/ouverture/signup/data/signup_api_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignupController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  BuildContext mContext;
  var overlay;
  TextEditingController usernameController, passwordController;
  SignupServices _signupServices = new SignupServices();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  var prefUtils = new PrefUtils();

  var passwvisible;
  var loading = false;

  var username = '';
  var password = '';
  var partnerName = '';

  void initContext(BuildContext context) {
    mContext = context;
  }

  @override
  void onInit() {
    prefUtils.init();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwvisible = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void switchPassVis() {
    passwvisible = !passwvisible;
    update();
  }

  String validateEmail(String value) {
    if (value.length <= 0) {
      return "field_required".tr;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length <= 0) {
      return "field_required".tr;
    }
    return null;
  }

  void setLoading(state) async {
    print(state);
    if (state) {
      showLoader("");
    } else
      await hideLoadingDialog();
    update();
  }

  validate(TextEditingController textEditingController) {
    if (textEditingController.text.length == 0) {
      return false;
    }
    return true;
  }

  void checksignup() {

    if (!validate(usernameController) || !validate(passwordController)) {
      return;
    }
    signup();
  }

  signup() async {
    try {
      print(usernameController.text);

      _signupServices.doSignup(
          loginData: json.encode({
            "email": usernameController.text,
            "password":passwordController.text
          }),

          onSuccess: (data) {
            onLoginSuccess(data);
          }

      );
    } finally {
    }
    update();



  }

  void onLoginSuccess(data) async {

    print("success");
    print("$data");
    Get.to(LoginView());


  }

}