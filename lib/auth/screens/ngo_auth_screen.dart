import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:volunteers_connect/auth/screens/ngo_registration_form.dart';
import 'package:volunteers_connect/auth/services/ngo_auth_services.dart';
import 'package:volunteers_connect/auth/widgets/loginButton.dart';
import 'package:volunteers_connect/common/utils.dart';
import 'package:volunteers_connect/home/screens/ngo_home.dart';

import '../../common/color_file.dart';
import '../widgets/custom_text_input_feild.dart';
import '../widgets/or_divider.dart';

class NGOAuthScreen extends ConsumerWidget {
  NGOAuthScreen({super.key});
  // ignore: non_constant_identifier_names
  final TextEditingController NGOPasswordTextEditingController =
      TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController NGOUniqueVCNumberTextEditingController =
      TextEditingController();
  static const String routeName = '/NGOAuthScreen';
  final NGOAuthServies _ngoAuthServies = NGOAuthServies();
  void navigateToNGOHomeScreen(WidgetRef ref, BuildContext context) {
    _ngoAuthServies
        .ngoSignIn(
            uniqueId: NGOUniqueVCNumberTextEditingController.text,
            password: NGOPasswordTextEditingController.text,
            context: context,
            ref: ref)
        .then((_) => Navigator.of(context).pushNamedAndRemoveUntil(
            NGOMainHomeScreen.routeName, (route) => false));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 100),
          child: Card(
            elevation: 5,
            color: HexColor("#ffffff"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    "Sign in to VolunteersConnect.com with name and password",
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
                Form(
                  key: Keys.ngoSignInKey,
                  child: Column(
                    children: [
                      CustomInputTextField(
                        textEditingController:
                            NGOUniqueVCNumberTextEditingController,
                        labelText: "NGO unique ID",
                        inputHintText: "Enter NGO Unique ID",
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please type the NGO UniqueId";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputTextField(
                        textEditingController: NGOPasswordTextEditingController,
                        labelText: "password",
                        inputHintText: "Enter your password",
                        isobscureText: true,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please create the NGO's Password";
                          }
                          if (value.length < 6) {
                            return "please create a password of lenght greater than 5";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginButton(ontap: () {
                  if (Keys.ngoSignInKey.currentState!.validate()) {
                    navigateToNGOHomeScreen(ref, context);
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
                orDivider(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Haven't registered  your NGO !",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: wordColor, fontWeight: FontWeight.bold),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   "Register here",
                //   style: TextStyle(
                //       color: Colors.red,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       decoration: TextDecoration.underline),
                // )
                LoginButton(
                  mainText: "Register Here",
                  ontap: () => Navigator.of(context)
                      .pushNamed(NGORegistrationPage.routeName),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
