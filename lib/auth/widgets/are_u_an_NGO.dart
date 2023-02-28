import 'package:flutter/material.dart';
import 'package:volunteers_connect/auth/screens/ngo_auth_screen.dart';

import '../../common/color_file.dart';

class AreuAnNGO extends StatelessWidget {
  const AreuAnNGO({super.key});

  navigateToNGOAuthScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NGOAuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Are you an NGO?",
          style: TextStyle(color: wordColor, fontSize: 18),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => navigateToNGOAuthScreen(context),
          child: const Text(
            "Sign In Here",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 17, 0),
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
