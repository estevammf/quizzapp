
import 'package:flutter/material.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/layout/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {

  final String? title;
  final String? image;
  final int? questionAnswered;
  final int? questionLength;

  final VoidCallback? onTap;

  const QuizCardWidget({Key? key, this.title, this.image, this.questionAnswered = 0, this.questionLength, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              height:40,
              width:40,
              child: Image.asset(image!),
            ),
            SizedBox(height:20),
            Text(title!, style: AppTextStyles.heading15,),
            SizedBox(height:20),
            Row(
              children: [
                // ignore: unnecessary_brace_in_string_interps
                Expanded(flex: 1, child: Text("${questionAnswered}/${questionLength}", style: AppTextStyles.body11,)),
                Expanded(flex: 4, child: ProgressIndicatorWidget(value: (questionAnswered!/questionLength!)))
              ],
            )
          ]
        ),
      ),
    );
  }
}