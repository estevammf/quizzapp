
import 'package:flutter/material.dart';
import 'package:quizapp/shared/layout/layout.dart';

class ChartWidget extends StatelessWidget {

  final int percent;

  const ChartWidget({Key? key, this.percent = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: (percent/100),
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          // ignore: unnecessary_brace_in_string_interps
          Center(child: Text("${percent}%", style: AppTextStyles.heading))
        ],
      ),
    );
  }
}