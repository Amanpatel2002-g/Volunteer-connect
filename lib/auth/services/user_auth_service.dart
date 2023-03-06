import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/errorHandling.dart';
import 'package:volunteers_connect/common/shared_preferences_file.dart';
import 'package:volunteers_connect/common/utils.dart';
import 'package:volunteers_connect/home/screens/user_connect_screen.dart';
import 'package:volunteers_connect/home/screens/user_home_screen.dart';
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
    final userprovider = ref.watch((userProvider.notifier));
    final UserModel userModel = UserModel(
        id: '',
        username: username,
        email: email,
        password: password,
        token: '');
    http.Response res = await http.post(Uri.parse('$uri/api/user/signup'),
        headers: httpHeader, body: userModel.toJson());
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: (() {
          final UserModel user = UserModel.fromJson(res.body);
          userprovider.setUser(user);
          LocalStorage.setString(tokenKey, user.token);
          Navigator.pushNamedAndRemoveUntil(
              context, UserConnectScreen.routeName, (route) => false);
        }));
  }

  void volsignInService(String email, String password, BuildContext context,
      WidgetRef ref) async {
    UserModel user = UserModel(
        username: '', email: email, password: password, id: '', token: '');

    http.Response res = await http.post(Uri.parse('$uri/api/user/signin'),
        headers: httpHeader, body: user.toJson());
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: (() {
          user = UserModel.fromJson(res.body);
          ref.watch(userProvider.notifier).setUser(user);
          LocalStorage.setString(tokenKey, user.token);
          Navigator.pushNamedAndRemoveUntil(
              context, UserHomeScreen.routeName, (route) => false);
        }));
  }

  Future<void> getUserData(BuildContext context, WidgetRef ref) async {
    String? token = await LocalStorage.getString(tokenKey);
    if (token == null) {
      return;
    }
    http.Response res = await http.get(Uri.parse('$uri/api/user/verifyToken'),
        headers: getHeaderWithToken(token));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          final UserModel user = UserModel.fromJson(res.body);
          ref.read(userProvider.notifier).setUser(user);
        });
  }
}
