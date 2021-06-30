
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/shared/layout/layout.dart';

class NextButtonWidget extends StatelessWidget {
  final String? label;
  final Color? backGroundColor;
  final Color? fontColor;
  final Color? borderColor;

  final VoidCallback? onTap;

  const NextButtonWidget({
    this.label,
    this.backGroundColor,
    this.fontColor,
    this.borderColor,
    this.onTap,
  });

  NextButtonWidget.green({this.label, this.onTap}) :
    this.backGroundColor = AppColors.darkGreen,
    this.fontColor = AppColors.white,
    this.borderColor = AppColors.darkGreen;
  
  NextButtonWidget.white({this.label, this.onTap}) :
    this.backGroundColor = AppColors.white,
    this.fontColor = AppColors.grey,
    this.borderColor = AppColors.border;

  NextButtonWidget.purple({this.label, this.onTap}) :
    this.backGroundColor = AppColors.purple,
    this.fontColor = AppColors.white,
    this.borderColor = AppColors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: this.borderColor!)),
        color: this.backGroundColor,
        borderRadius: BorderRadius.circular(10)
        ),
      child: TextButton(onPressed: this.onTap, 
      style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.green)
            ),
        child: Text(
            label!, 
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, 
              fontSize: 15,
              color: this.fontColor
            )))
      );
  }
}
