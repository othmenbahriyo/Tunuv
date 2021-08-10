import 'package:admin/pages/ouverture/splush/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashView extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) =>RepaintBoundary(
        child: Material(
          child: Container(
            decoration: new BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Center(
                    child: Lottie.asset(
                      "assets/image/lotlog.json",
                    )),
              ],
            ),
          ),
        )));
  }
}
