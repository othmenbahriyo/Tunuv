import 'package:admin/pages/catalogue/presentation/controller/catalogue_controller.dart';
import 'package:admin/pages/catalogue/presentation/view/widget/buildicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color textColor = Colors.black54;
Color textSecondry = Colors.grey;

class CatalogueView extends GetView<CatalogueController> {
  final CatalogueController catalogController = Get.put(CatalogueController());
  String title;
  String rate;
  String place;
  String price;

  CatalogueView(this.title, this.rate, this.place, this.price);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          color: Color(0xFFf7f7f7),
          child: Scaffold(
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: FlatButton(
                color: Colors.teal,
                onPressed: () {},
                textColor: Colors.white,
                child: Text(
                  'BOOK',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/image/explore1.jpg'),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Align(
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: textColor,
                            ),
                            onPressed: () {}),
                        alignment: Alignment.topRight,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  child: Card(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '$title',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: textColor),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '$place',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: textColor,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        child: Text(
                                          'Price',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: textColor,
                                              fontFamily: 'Quicksand'),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      Text(
                                        'Rs $price',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: textColor,
                                            fontFamily: 'Quicksand'),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        child: Text(
                                          'Rating',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: textColor,
                                              fontFamily: 'Quicksand'),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      buildicons('$rate'),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.share,
                                        color: textColor,
                                      ),
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                          DefaultTabController(
                              length: 4,
                              initialIndex: 0,
                              child: Column(
                                children: <Widget>[
                                  TabBar(
                                    indicatorColor:
                                        Theme.of(context).primaryColor,
                                    labelColor: textColor,
                                    unselectedLabelColor: textColor,
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                        text: 'Details',
                                      ),
                                      Tab(
                                        text: 'Rooms',
                                      ),
                                      Tab(
                                        text: 'Reviews',
                                      ),
                                      Tab(
                                        text: 'Near By',
                                      )
                                    ],
                                  ),
                                  Container(
                                      height: 300.0,
                                      child: TabBarView(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                'this is a demo hotel',
                                                style:
                                                    TextStyle(color: textColor),
                                              )),
                                          Center(child: Text('Reviews here')),
                                          Center(child: Text('Reviews here')),
                                          Center(child: Text('Near by here')),
                                        ],
                                      ))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
