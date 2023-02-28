import 'package:flutter/material.dart';
import 'package:volunteers_connect/auth/screens/ngo_auth_screen.dart';
import 'package:volunteers_connect/auth/screens/ngo_registration_form.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_sign_up.dart';
import 'package:volunteers_connect/common/default_screen.dart';
import 'package:volunteers_connect/home/screens/ngo_Home_Screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case VolAuthSignUp.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => VolAuthSignUp());
    case NGOAuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => NGOAuthScreen());
    case NGOHomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const NGOHomeScreen());
    case NGORegistrationPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const NGORegistrationPage());
    case DefaultPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "This is the default page "));
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "Page Does not exist"));
  }
}
