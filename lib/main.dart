import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizapp/account/account_page.dart';
import 'package:quizapp/shared/layout/app_colors.dart';
import 'package:quizapp/splash/splash_page.dart';

void main(){   
  runApp(MyApp());
  HttpOverrides.global = new MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz - App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.white
      ),
      home: SplashPage(),
    );
  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
 }
