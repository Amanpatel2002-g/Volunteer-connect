// ignore: file_names
import 'package:flutter/material.dart';

class NGOHomeScreen extends StatelessWidget {
  const NGOHomeScreen({super.key});
  static const String routeName = '/NGOHomeScreen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is home page for the project'),
      ),
    );
  }
}
