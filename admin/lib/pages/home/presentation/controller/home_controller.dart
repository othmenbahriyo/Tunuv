import 'package:admin/Utils/PrefUtils.dart';
import 'package:admin/pages/catalogue/presentation/view/catalogue_view.dart';
import 'package:admin/pages/home/data/home_api_provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  var prefUtils = new PrefUtils();
  HomeServices homeServices = new HomeServices();
  var layer = "".obs ;
  var listMarker = [].obs ;
  var markers = <Marker>[
    Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng( 51.5, -0.09 ),
      builder: (ctx) => Container(
          child: GestureDetector(
            onTap: () {
              Get.to(() => CatalogueView("Mouradi hot",'5',"Hammemet-barraka","329",));
            },
            child: Icon(
              Icons.place,
              color: Colors.red,
              size: 40,
            ),
          )),
    )
  ].obs;



  @override
  Future<void> onInit() async {
    super.onInit();
    prefUtils.init();
    layer.value = "0";
   await getListMarker();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getListMarker() async {
    try {
     var prefs = await SharedPreferences.getInstance();
      homeServices.getallMarker(
        onSuccess: (posts) {
          listMarker.assignAll(posts);
          print("bbbbbbbbbbbbb$posts");
          for(int i = 0; i < listMarker.length; i++){
            print(listMarker[i]['locations'][0]['coords']['latitude']);

            markers.add( Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(listMarker[i]['locations'][0]['coords']['latitude'] * 1.0, listMarker[i]['locations'][0]['coords']['longitude'] * 1.0),
              builder: (ctx) => Container(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => CatalogueView(listMarker[i]['name'],listMarker[i]['locations'][0]['coords']['altitude'].toString(),listMarker[i]['locations'][0]['coords']['place'],listMarker[i]['locations'][0]['coords']['price'],));
                    },
                    child: Icon(
                      Icons.place,
                      color: Colors.red,
                      size: 40,
                    ),
                  )),
            ));
            print(markers.length);
          }
          update();
        },
        onError: (error) {
          update();
          print(error);
        },
      );
    } finally {
    }
    update();
  }



}