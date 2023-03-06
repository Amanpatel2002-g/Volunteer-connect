import 'package:flutter/material.dart';
import 'package:volunteers_connect/auth/screens/ngo_auth_screen.dart';
import 'package:volunteers_connect/auth/screens/ngo_registration_form.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_screen_sign_in.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_sign_up.dart';
import 'package:volunteers_connect/common/default_screen.dart';
import 'package:volunteers_connect/home/screens/ngo_add_post_page.dart';
import 'package:volunteers_connect/home/screens/ngo_home.dart';
import 'package:volunteers_connect/home/screens/ngo_job_post_form.dart';
import 'package:volunteers_connect/home/screens/ngo_post_screen.dart';
import 'package:volunteers_connect/home/screens/ngo_profile_page.dart';
import 'package:volunteers_connect/home/screens/ngo_seeing_jobs.dart';
import 'package:volunteers_connect/home/screens/ngo_seeing_volunteers_applied.dart';
import 'package:volunteers_connect/home/screens/user_add_post.dart';
import 'package:volunteers_connect/home/screens/user_connect_screen.dart';
import 'package:volunteers_connect/home/screens/user_home_screen.dart';
import 'package:volunteers_connect/home/screens/user_ngo_apply_screen.dart';
import 'package:volunteers_connect/home/widgets/complete_post_widget.dart';
import 'package:volunteers_connect/models/job_model.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case VolAuthSignUp.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => VolAuthSignUp());
    case NGOAuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => NGOAuthScreen());
    case UserConnectScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => UserConnectScreen());
    case NGOseeingJobs.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NGOseeingJobs(),
      );
    case UserAddPostPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserAddPostPage(),
      );
    case UserHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserHomeScreen(),
      );
    case NGOMainHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NGOMainHomeScreen(),
      );
    case CompletePostWidget.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CompletePostWidget(),
      );
    case NGOPostAddPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NGOPostAddPage(),
      );
    case NGOPostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NGOPostScreen(),
      );
    case NGOProfilePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const NGOProfilePage());
    case VolAuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => VolAuthScreen());
    case NGOseeingVolunteersApplied.routeName:
      String jobId = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NGOseeingVolunteersApplied(jobId: jobId),
      );
    case UserNGOApplyScreen.routeName:
      Job job = routeSettings.arguments as Job;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => UserNGOApplyScreen(
                job: job,
              ));
    case NGORegistrationPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const NGORegistrationPage());
    case NGOJobpostForm.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => NGOJobpostForm());
    case DefaultPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "This is the default page"));
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DefaultPage(text: "Page Does not exist"));
  }
}
