// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomFormTextField extends StatefulWidget {
  final String inputHintText;
  final TextEditingController textEditingController;
  final int lines;
  final bool enabled;
  const CustomFormTextField(
      {Key? key,
      this.enabled = true,
      required this.inputHintText,
      required this.textEditingController,
      this.lines = 1})
      : super(key: key);

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 11),
          color: Colors.white,
          child: TextField(
            enabled: widget.enabled,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              hintText: widget.inputHintText,
              hintStyle: TextStyle(color: HexColor("#a9a9a9")),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            controller: widget.textEditingController,
            maxLines: widget.lines,
          ),
        )
      ],
    );
  }
}
