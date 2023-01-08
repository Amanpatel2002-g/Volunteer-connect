// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget GoogleIcon() {
  return Container(
    width: 60,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            // decoration: BoxDecoration(color: Colors.blue),
            child: Image.network(
                'http://pngimg.com/uploads/google/google_PNG19635.png',
                fit: BoxFit.cover)),
      ],
    ),
  );
}

class LoginWithGoogle extends StatelessWidget {
  final String? islogin;
  const LoginWithGoogle({
    Key? key,
    this.islogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String toshow = islogin ?? "Login";
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(width: 15, color: Color.fromARGB(195, 230, 227, 227))),
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleIcon(),
              Container(
                width: 240,
                alignment: Alignment.center,
                child: Text(
                  "$islogin with Google",
                  style: TextStyle(fontSize: 20, color: HexColor("#1d4980")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
