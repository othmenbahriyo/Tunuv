
import 'package:admin/component/Buttons.dart';
import 'package:admin/lang/controller/LocalizationController.dart';
import 'package:admin/lang/LocalizationService.dart';
import 'package:admin/library/size_config.dart';
import 'package:admin/pages/ouverture/login/presentation/controllers/login_controller.dart';
import 'package:admin/pages/ouverture/signup/presentation/views/signup_view.dart';
import 'package:admin/routes/app_pages.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  LocalizationController localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    controller.initContext(context);
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: body(loginController, context),
    );
  }

  Center body(LoginController loginController, BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("login".tr,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(loginController, context),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                // NoAccountText(),
              ],
            ),
          ),
        ),
    );
  }

  Future<bool> _onBackPressed() {}

  TextFormField buildEmailFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      controller: controller.usernameController,
      validator: (value) {
        return controller.validateEmail(value);
      },
      onSaved: (value) {
        controller.username = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        prefixIcon: Icon(
          Icons.supervised_user_circle_sharp,
          color: Color(0xFF666666),
          size: 20,
        ),
        fillColor: Color(0xFFF2F3F5),
        hintStyle: GoogleFonts.roboto(
          textStyle: TextStyle(color: Colors.grey, letterSpacing: .5),
        ),
        hintText: "username".tr,
      ),
    );
  }

  GetBuilder buildPasswordFormField() {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) => TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.passwordController,
              onSaved: (value) {
                controller.password = value;
              },
              validator: (value) {
                return controller.validatePassword(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(controller.passwvisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    controller.switchPassVis();
                  },
                ),
                filled: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF666666),
                  size: 20,
                ),
                fillColor: Color(0xFFF2F3F5),
                hintStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.grey, letterSpacing: .5),
                ),
                hintText: "password".tr,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.passwvisible,
            ));
  }

  WillPopScope SignForm(LoginController loginController, BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(()=>SignupView());
                },
                child: Text(
                  "signup".tr,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),

          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
            child: Container(
              width: double.infinity,
              child: DefaultButton(
                text: "login".tr,
                press: () {
                  FocusScope.of(context).unfocus();
                  controller.checkLogin();
                },
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "lang".tr,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20,),
              new DropdownButton<String>(
                  items: LocalizationService.langs.map((List value) {
                    return new DropdownMenuItem<String>(
                      value: value[0],
                      child: Row(children: [
                        Flag(value[1], height: 12, width: 12,),
                        SizedBox(width: 7,),
                        Text(value[0], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                      ),
                    );
                  }).toList(),
                value: localizationController.lng,
                underline: Container(color: Colors.transparent),
                isExpanded: false,
                onChanged: (newVal) {
                    localizationController.setLanguage(newVal);
                },
              )
            ],
          ),

        ],
      ),
    );
  }
}
