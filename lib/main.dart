import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/auth/screens/ngo_auth_screen.dart';
import 'package:volunteers_connect/auth/screens/ngo_registration_form.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_screen_sign_in.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_sign_up.dart';
import 'package:volunteers_connect/auth/services/user_auth_service.dart';
import 'package:volunteers_connect/common/default_screen.dart';
import 'package:volunteers_connect/common/intro_page.dart';
import 'package:volunteers_connect/common/routes.dart';
import 'package:volunteers_connect/providers/user_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool isCompleted = false;
  void initCaller() {
    AuthService().getUserData(context, ref).then((_) {
      isCompleted = true;
      setState(() {});
    });
  }

  @override
  void initState() {
    // initCaller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: VolAuthScreen(),
      // home: Builder(
      //   builder: (BuildContext context) {
      //     return isCompleted == false
      //         ? const Center(
      //             child: CircularProgressIndicator(),
      //           )
      //         : ref.watch(userProvider.notifier).user == null
      //             ? VolAuthSignUp()
      //             : const DefaultPage(text: "This is home page");
      // return VolAuthScreen();
    );
    // ));
    // ));
  }
}
