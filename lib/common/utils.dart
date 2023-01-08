import 'package:flutter/material.dart';

String uri = "http://10.0.2.2:3000";

const String tokenKey = 'x-auth-token';

final httpHeader = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

getHeaderWithToken(String token){
  return  <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
  'token':token,
};
}



void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
