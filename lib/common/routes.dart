import 'package:flutter/material.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_sign_up.dart';
import 'package:volunteers_connect/common/default_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case VolAuthSignUp.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => VolAuthSignUp());
    case DefaultPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "This is the default page "));
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "Page Does not exist")
              );
  }
}
