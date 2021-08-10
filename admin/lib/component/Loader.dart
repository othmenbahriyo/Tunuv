import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:load/load.dart';

void showLoader(String text) async {
  await showCustomLoadingWidget(
      Center(
          child: Container(
              //decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    Text(text, style: TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.none),)
                  ]
              ))),
      tapDismiss: false,
  );
}