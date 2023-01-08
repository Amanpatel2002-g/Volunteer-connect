// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginButton extends StatelessWidget {
  final String? mainText;
  final VoidCallback ontap;
  const LoginButton({
    Key? key,
    this.mainText,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String toshow = mainText ?? "Login";
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(
            double.infinity,
            50,
          )),
          backgroundColor:
              MaterialStateProperty.all<Color>(HexColor("#0073e6")),
        ),
        child: Text(
          toshow,
          style: TextStyle(color: HexColor("#ecffff"), fontSize: 20),
        ),
      ),
    );
  }
}
