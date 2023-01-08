import 'package:flutter/material.dart';

AppBar customAppBar({required Widget? titleWidget}) {
  return AppBar(
    title: titleWidget,
    backgroundColor: Colors.white,
    elevation: 7,
  );
}
