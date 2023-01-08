import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../common/color_file.dart';
import '../widgets/custom_text_input_feild.dart';
import '../widgets/or_divider.dart';

class NGOAuthScreen extends StatelessWidget {
  NGOAuthScreen({super.key});
    // ignore: non_constant_identifier_names
    final TextEditingController NGONameTextEditingController =
      TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController NGOUniqueVCNumberTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 100),
          child: Card(
            elevation: 5,
            color: HexColor("#ffffff"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      color: HexColor("#1d4980"),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Sign in to VolunteersConnect.com with UniqueVCNumber",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor("#1d4980"),
                        fontSize: 18,
                        letterSpacing: -0.3),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInputTextField(
                  textEditingController: NGONameTextEditingController,
                    labelText: "NGO unique Name",
                    inputHintText: "Enter NGO Unique Name"),
                const SizedBox(
                  height: 20,
                ),
                CustomInputTextField(
                  textEditingController: NGOUniqueVCNumberTextEditingController,
                    labelText: "UniqueVCNumber",
                    inputHintText: "Enter your UniqueVC Number"),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                orDivider(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Haven't registered  your NGO on Volunteer Connect !",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: wordColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Register here",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
