import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 300,
              child: Image.asset('assets/images/logo-no-background.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: 0.3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
