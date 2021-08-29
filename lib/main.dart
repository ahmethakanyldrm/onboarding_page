import 'package:flutter/material.dart';
import 'package:onboarding_page/views/home_view.dart';
import 'package:onboarding_page/views/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
