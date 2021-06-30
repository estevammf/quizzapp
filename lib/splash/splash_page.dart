import 'package:flutter/material.dart';
import 'package:quizapp/login/login_page.dart';
import 'package:quizapp/shared/layout/layout.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Image.asset(AppImages.logoSplash),
          ),
        ),
      ),
    );
  }
}