import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:volunteers_connect/common/color_file.dart';

Widget orDivider() {
  return Row(children: <Widget>[
    Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: Divider(
            color: wordColor,
            height: 36,
            thickness: 1,
          )),
    ),
    Text(
      "Or",
      style: TextStyle(color: wordColor),
    ),
    Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Divider(
            color: wordColor,
            height: 36,
            thickness: 1,
          )),
    ),
  ]);
}
