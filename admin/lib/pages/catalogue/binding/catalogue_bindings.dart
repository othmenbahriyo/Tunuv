import 'package:admin/pages/catalogue/presentation/controller/catalogue_controller.dart';
import 'package:get/get.dart';


class CatalogueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogueController>(
          () => CatalogueController(),
    );
  }
}