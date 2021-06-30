import 'package:flutter/material.dart';
import 'package:quizapp/shared/layout/app_colors.dart';

class AppGradients {
  static final linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.linearGradient1,
      AppColors.linearGradient2,
      AppColors.linearGradient3,
      AppColors.linearGradient4,
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  );
}
