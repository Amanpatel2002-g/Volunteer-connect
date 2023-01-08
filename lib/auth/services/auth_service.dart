import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/default_screen.dart';
import 'package:volunteers_connect/common/errorHandling.dart';
import 'package:volunteers_connect/common/shared_preferences_file.dart';
import 'package:volunteers_connect/common/utils.dart';
import 'package:volunteers_connect/models/userModel.dart';

import '../../providers/user_provider.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() {
    return _instance;
  }
  AuthService._internal();

  void volsignUpService(String username, String email, String password,
      BuildContext context, WidgetRef ref) async {
    final UserModel userModel = UserModel(
        id: '',
        username: username,
        email: email,
        password: password,
        token: '');
    http.Response res = await http.post(Uri.parse('$uri/api/signup'),
        headers: httpHeader, body: userModel.toJson());
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: (() {
          final UserModel user = UserModel.fromJson(res.body);
          ref.watch((userProvider.notifier)).setUser(user);
          LocalStorage.setString(tokenKey, user.token);
          Navigator.pushNamed(context, DefaultPage.routeName);
        }));
  }

  void volsignInService(String email, String password, BuildContext context,
      WidgetRef ref) async {
    UserModel user = UserModel(
        username: '', email: email, password: password, id: '', token: '');

    http.Response res = await http.post(Uri.parse('$uri/api/signin'),
        headers: httpHeader, body: user.toJson());
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: (() {
          user = UserModel.fromJson(res.body);
          ref.watch(userProvider.notifier).setUser(user);
          LocalStorage.setString(tokenKey, user.token);
          Navigator.pushNamed(context, DefaultPage.routeName);
        }));
  }

  Future<void> getUserData(BuildContext context, WidgetRef ref) async {
    String? token = await LocalStorage.getString(tokenKey);
    if (token == null) {
      return;
    }
    http.Response res = await http.get(Uri.parse('$uri/api/verifyToken'),
        headers: getHeaderWithToken(token));
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          final UserModel user = UserModel.fromJson(res.body);
          ref.read(userProvider.notifier).setUser(user);
        });
  }
}