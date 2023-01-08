import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_sign_up.dart';
import 'package:volunteers_connect/common/color_file.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: wordColor, fontSize: 18),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, VolAuthSignUp.routeName),
          child: Text(
            "Sign Up here",
            style: TextStyle(
                color: wordColor, fontWeight: FontWeight.bold, fontSize: 18, ),
          ),
        )
      ],
    );
  }
}
