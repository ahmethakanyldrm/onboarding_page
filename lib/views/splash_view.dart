import 'package:flutter/material.dart';
import 'package:onboarding_page/constants/constants_style.dart';
import 'package:onboarding_page/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
        Duration(
          seconds: 2,
        ),
        () {});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Yükleniyor...",
                style: ConstantsStyle.splashStyle,
              ),
              SizedBox(
                height: 15,
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
