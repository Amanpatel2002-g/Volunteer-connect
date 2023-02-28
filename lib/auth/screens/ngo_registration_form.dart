// This is NGO registration form for the

// Registration
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:volunteers_connect/auth/services/ngo_auth_services.dart';
import 'package:volunteers_connect/auth/widgets/loginButton.dart';
import 'package:volunteers_connect/home/screens/ngo_Home_Screen.dart';
import '../widgets/custom_text_input_feild.dart';

class NGORegistrationPage extends ConsumerStatefulWidget {
  const NGORegistrationPage({super.key});
  static const String routeName = '/NGORegistrationScreen';

  @override
  ConsumerState<NGORegistrationPage> createState() => _NGORegistrationPageState();
}

class _NGORegistrationPageState extends ConsumerState<NGORegistrationPage> {
  final TextEditingController ngoNameTextEditingController =
      TextEditingController();

  // ignore: non_constant_identifier_names
  final TextEditingController NGOPasswordTextEditingController =
      TextEditingController();
  final TextEditingController uniqueIdTextEditingController =
      TextEditingController();
  final _fromkey = GlobalKey<FormState>();
  final NGOAuthServies _ngoAuthServies = NGOAuthServies();
  String countryValue = 'India';
  String stateValue = '';
  String cityValue = '';

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
            child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Sign Up",
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
                      "Sign up to VolunteersConnect.com with NGO name and password",
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
                    textEditingController: ngoNameTextEditingController,
                    labelText: "NGO unique Name",
                    inputHintText: "Enter NGO Unique Name",
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please type the NGO name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputTextField(
                    labelText: 'Unique Id',
                    inputHintText: 'Enter your Unique Id ',
                    textEditingController: uniqueIdTextEditingController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please type the NGO unique ID";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputTextField(
                    labelText: 'Password',
                    inputHintText: 'Enter your password ',
                    textEditingController: NGOPasswordTextEditingController,
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
                  const SizedBox(
                    height: 60,
                  ),
                  LoginButton(
                    mainText: "Submit",
                    ontap: () {
                      if (_fromkey.currentState!.validate()) {
                        _ngoAuthServies.ngoSignUp(
                            uniqueId: uniqueIdTextEditingController.text,
                            ngoName: ngoNameTextEditingController.text,
                            password: NGOPasswordTextEditingController.text,
                            context: context,
                            ref: ref);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            NGOHomeScreen.routeName, (route) => false);
                      }
                    },
                  )
                  // Container(
                  //   margin:
                  //       const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  //   child: SelectState(
                  //       style: TextStyle(
                  //           color: HexColor("#1d4980"),
                  //           decoration: TextDecoration.none,
                  //           fontWeight: FontWeight.bold),
                  //       onCountryChanged: (value) {
                  //         setState(() {
                  //           countryValue = value;
                  //         });
                  //       },
                  //       onStateChanged: (value) {
                  //         setState(() {
                  //           stateValue = value;
                  //         });
                  //       },
                  //       onCityChanged: (value) {
                  //         cityValue = value;
                  //       }),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
