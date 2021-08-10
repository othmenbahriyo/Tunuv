import 'package:flutter/material.dart';

Widget buildicons(index) {
  List<Widget> widgets = List<Widget>();
  for (int i=0;i<int.tryParse(index);i++){
    widgets.add (Icon(Icons.star,color: Colors.orange[100],size: 15,));
  }
  return Row(children: widgets);
}
