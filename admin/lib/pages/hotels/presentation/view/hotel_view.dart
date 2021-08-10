import 'package:admin/pages/catalogue/presentation/controller/catalogue_controller.dart';
import 'package:admin/pages/hotels/presentation/view/widget/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color textColor = Colors.black54;
Color textSecondry = Colors.grey;

class HotelView extends GetView<CatalogueController> {
  final CatalogueController catalogController = Get.put(CatalogueController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFF5721),
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.back();
              },
            ),
            title: Text(
              'Bookings',
              style: TextStyle(
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: ListView(
            children: <Widget>[
              itemCard('Hatke Hotel', 'assets/image/exploreOyoHotels1.jpeg',
                  false),
              itemCard('Hatke Hotel', 'assets/image/exploreOyoHotels1.jpeg',
                  false),
              itemCard('Hatke Hotel', 'assets/image/exploreOyoHotels1.jpeg',
                  false),
              itemCard('Hatke Hotel', 'assets/image/exploreOyoHotels1.jpeg',
                  false),
              itemCard('Hatke Hotel', 'assets/image/exploreOyoHotels1.jpeg',
                  false),
            ],
          ));
  }
}
