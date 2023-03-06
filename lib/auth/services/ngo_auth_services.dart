import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/errorHandling.dart';
import 'package:volunteers_connect/common/shared_preferences_file.dart';
import 'package:volunteers_connect/models/ngoModel.dart';
import 'package:volunteers_connect/providers/ngo_provider.dart';

import '../../common/utils.dart';

class NGOAuthServies {
  static final NGOAuthServies _instance = NGOAuthServies._internal();
  factory NGOAuthServies() {
    return _instance;
  }
  NGOAuthServies._internal();

  Future<void> ngoSignIn(
      {required String uniqueId,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    http.Response res = await http.post(Uri.parse('$uri/api/ngo/signIn'),
        headers: httpHeader,
        body: jsonEncode({'uniqueId': uniqueId, 'password': password}));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          ref.watch(NgoProvider.notifier).setNGO(NGOModel.fromJson(res.body));
          NGOModel ngoModel = ref.watch(NgoProvider.notifier).ngo!;
          LocalStorage.setString(tokenKey, ngoModel.token);
        });
  }

  Future<void> ngoSignUp(
      {required String uniqueId,
      required String ngoName,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    http.Response res = await http.post(Uri.parse('$uri/api/ngo/signUp'),
        headers: httpHeader,
        body: jsonEncode(
            {'uniqueId': uniqueId, 'password': password, 'name': ngoName}));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res, 
        onSuccess: () {
          ref.watch(NgoProvider.notifier).setNGO(NGOModel.fromJson(res.body));
          NGOModel ngoModel = ref.watch(NgoProvider.notifier).ngo!;
          LocalStorage.setString(tokenKey, ngoModel.token);
        });
  }
}
