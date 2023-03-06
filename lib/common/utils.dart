import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

String uri = "http://10.0.2.2:3000";

const String tokenKey = 'x-auth-token';

final httpHeader = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

getHeaderWithToken(String token) {
  return <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    tokenKey: token,
  };
}

class PostType {
  static const ngo = "NGO";
  static const user = "user";
}

class Keys {
  static final ngosignUpKey = GlobalKey<FormState>();
  static final ngoSignInKey = GlobalKey<FormState>();
  static final userSignInKey = GlobalKey<FormState>();
  static final userSignUpKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
}

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<PlatformFile?> pickImage() async {
  PlatformFile? image;
  try {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (file != null) {
      image = file.files.first;
    }
  } catch (e) {
    debugPrint("This is the error from the pickImage");
    debugPrint(e.toString());
  }
  return image;
}
