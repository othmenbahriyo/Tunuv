import 'package:admin/pages/ouverture/signup/presentation/controllers/signup_controller.dart';
import 'package:get/get.dart';


class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
          () => SignupController(),
    );
  }
}