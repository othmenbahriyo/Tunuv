import 'package:admin/Utils/PrefUtils.dart';
import 'package:get/get.dart';

import '../LocalizationService.dart';

class LocalizationController extends GetxController {
  PrefUtils prefUtils = new PrefUtils();
  String lng = "English";
  @override
  void onInit() async {
    await prefUtils.init();
    var value = prefUtils.getLocale();
      if(value != "") {
        lng = value;
        print("lang $lng");
        setLanguage(lng);
        update();
      }
    super.onInit();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setLanguage(String lang) {
    lng = lang;
    prefUtils.setLocale(lang);
    LocalizationService().changeLocale(lang);
  }
}