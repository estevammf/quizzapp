import 'package:flutter/material.dart';
import 'package:quizapp/home/widgets/chart/chart_widget.dart';
import 'package:quizapp/shared/layout/layout.dart';

class ScoreCardWidget extends StatelessWidget {
  final int percent;

  const ScoreCardWidget({Key? key, this.percent = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(percent: percent)
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Vamos Começar", style: AppTextStyles.heading),
                      Text("Complete o desafio", style: AppTextStyles.body)
                    ]
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}