// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomInputTextField extends StatefulWidget {
  final String labelText;
  final String inputHintText;
  final TextEditingController textEditingController;
  bool isobscureText;
  final String? Function(String?)? validate;
  CustomInputTextField({
    Key? key,
    required this.labelText,
    required this.inputHintText,
    required this.textEditingController,
    this.isobscureText = false,
    this.validate,
  }) : super(key: key);

  @override
  State<CustomInputTextField> createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  @override
  Widget build(BuildContext context) {
    bool _isobseureText = widget.isobscureText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 350,
          child: Row(
            children: [
              Text(
                widget.labelText,
                style: TextStyle(
                    color: HexColor("#1d4980"),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
                // textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 350,
          child: TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              hintText: widget.inputHintText,
              hintStyle: TextStyle(color: HexColor("#a9a9a9")),
              filled: true,
              fillColor: HexColor("#f7f8fa"),
              focusedBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              // ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0, color: HexColor("#f7f8fa"))),
            ),
            obscureText: widget.isobscureText ? _isobseureText : false,
            validator: widget.validate,
            controller: widget.textEditingController,
          ),
        )
      ],
    );
  }
}
