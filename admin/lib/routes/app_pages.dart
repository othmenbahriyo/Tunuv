
import 'package:admin/pages/catalogue/binding/catalogue_bindings.dart';
import 'package:admin/pages/catalogue/presentation/view/catalogue_view.dart';
import 'package:admin/pages/home/bindings/home_bindings.dart';
import 'package:admin/pages/home/presentation/views/home_view.dart';

import 'package:admin/pages/ouverture/login/bindings/login_bindings.dart';
import 'package:admin/pages/ouverture/login/presentation/views/login_view.dart';
import 'package:admin/pages/ouverture/signup/bindings/signup_bindings.dart';
import 'package:admin/pages/ouverture/signup/presentation/views/signup_view.dart';
import 'package:admin/pages/ouverture/splush/bindings/splash_bindings.dart';
import 'package:admin/pages/ouverture/splush/presentation/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';
class AppPages {
  static const INITIAL = Routes.SPLACH;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/",
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.SPLACH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.CATALOGUE,
      page: () => CatalogueView("","","",""),
      binding: CatalogueBinding(),
    ),
   

  ];
}
