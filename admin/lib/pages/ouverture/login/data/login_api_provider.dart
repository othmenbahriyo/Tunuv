import 'dart:convert';

import 'package:admin/constant/constant.dart';
import 'package:admin/library/api_request.dart';
import 'package:admin/pages/home/presentation/views/home_view.dart';
import 'package:admin/pages/ouverture/login/presentation/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginServices {
  void doLogin(
      {
        Function() beforeSend,
        Function(dynamic data) onSuccess,
        Function(dynamic error) onError,
        var loginData,
      }) {
    ApiRequest(url: 'http://192.168.43.220:3000/signin', data: loginData).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        print(loginData);
        if(data['token'] != null) {
          onSuccess(data);

        } else {
          print("eddee");

        }
      },
      onError: (error) =>  Get.snackbar("Oops", "err".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white),
    );
  }

}
