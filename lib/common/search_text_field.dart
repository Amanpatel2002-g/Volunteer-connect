// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchTextField extends StatefulWidget {
  final String labelText;
  final String inputHintText;
  final TextEditingController textEditingController;
  bool isobscureText;
  final String? Function(String?)? validate;
  SearchTextField({
    Key? key,
    required this.labelText,
    required this.inputHintText,
    required this.textEditingController,
    this.isobscureText = false,
    this.validate,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final bool _isobseureText = widget.isobscureText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 290,
          height: 40,
          padding: const EdgeInsets.only(bottom: 1),
          child: TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: widget.inputHintText,
              hintStyle: TextStyle(
                color: HexColor("#a9a9a9"),
                textBaseline: TextBaseline.ideographic,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 206, 204, 204),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(width: 0, color: HexColor("#f7f8fa"))),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(width: 0, color: HexColor("#f7f8fa"))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
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
