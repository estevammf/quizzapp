
import 'package:flutter/material.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/layout/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int? currentQuestion;
  final int? questionsLength;

  const QuestionIndicatorWidget({Key? key, this.currentQuestion, this.questionsLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Questão ${this.currentQuestion}", style: AppTextStyles.body),
                Text("${this.currentQuestion} de ${this.questionsLength}", style: AppTextStyles.body),
              ],
            ),
            SizedBox(
              height: 16
            ),
            ProgressIndicatorWidget(value: (this.currentQuestion!/this.questionsLength!))
          ]
        ),
      ),
    );
  }
}