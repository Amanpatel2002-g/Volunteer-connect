import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:volunteers_connect/auth/services/user_auth_service.dart';
import 'package:volunteers_connect/auth/widgets/are_u_an_NGO.dart';
import 'package:volunteers_connect/auth/widgets/custom_text_input_feild.dart';
import 'package:volunteers_connect/auth/widgets/dontHaveAnAccount.dart';
import 'package:volunteers_connect/auth/widgets/loginButton.dart';
import 'package:volunteers_connect/auth/widgets/login_with_google_button.dart';
import 'package:volunteers_connect/auth/widgets/or_divider.dart';
import 'package:volunteers_connect/common/utils.dart';

class VolAuthScreen extends ConsumerWidget {
  VolAuthScreen({super.key});
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  static const String routeName = '/VolAuthSignInScreen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 100),
        child: SingleChildScrollView(
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
                    "Sign in to VolunteersConnect.com with google",
                    style: TextStyle(
                        color: HexColor("#1d4980"),
                        fontSize: 18,
                        letterSpacing: -0.3),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const LoginWithGoogle(
                      islogin: "Login",
                    )),
                orDivider(),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: Keys.userSignInKey,
                  child: Column(
                    children: [
                      CustomInputTextField(
                        textEditingController: _emailTextEditingController,
                        labelText: "Email Id",
                        inputHintText: "Enter your email Id",
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "email can't be empty";
                          } else if (RegExp(
                                  r'/^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/')
                              .hasMatch(value)) {
                            return "Enter email in correct format";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputTextField(
                        textEditingController: _passwordTextEditingController,
                        labelText: "Password",
                        inputHintText: "Enter your password",
                        isobscureText: true,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "password can't be empty";
                          } else if (value.length <= 8) {
                            return "password should be greater than lenght 8";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LoginButton(
                  ontap: () {
                    if (Keys.userSignInKey.currentState!.validate()) {
                      AuthService().volsignInService(
                          _emailTextEditingController.text,
                          _passwordTextEditingController.text,
                          context,
                          ref);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const DontHaveAnAccount(),
                const SizedBox(
                  height: 20,
                ),
                const AreuAnNGO(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
