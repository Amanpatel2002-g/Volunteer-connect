// ignore: file_names
import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/utils.dart';

void httpErrorHandling(
    {required BuildContext context,
    required http.Response response,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
    // debugdebugPrint("")
      debugPrint("This is from http ErrorHandling case:400 \n");
      debugPrint("The message is\n");
      debugPrint(jsonDecode(response.body)["msg"]);

      showSnackbar(context, jsonDecode(response.body)["msg"]);
      break;
    case 500:
      // debugPrint(jsonDecode(response.body));
      debugPrint("This is from http ErrorHandling case:500\n");

      showSnackbar(context, jsonDecode(response.body)["err"]);
      break;
    default:
      debugPrint("This is from http ErrorHandling case:default\n");
      debugPrint(response.body);
      showSnackbar(context, response.body);
  }
}
