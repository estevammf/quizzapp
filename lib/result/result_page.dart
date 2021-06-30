
import 'package:flutter/material.dart';
import 'package:quizapp/challenge/widgets/nextbutton/next_button_widget.dart';
import 'package:quizapp/shared/layout/layout.dart';

class ResultPage extends StatelessWidget {

  final String? title;
  final int? qtdQuestions;
  final int? qtdAwnserRight;

  const ResultPage({Key? key, this.title, this.qtdQuestions, this.qtdAwnserRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Text("Parabéns!", style: AppTextStyles.heading40,),
            SizedBox(height:16),
            Text.rich(TextSpan(text: "Você concluiu", style: AppTextStyles.body, children: [
              TextSpan(text: "\n${this.title}", style: AppTextStyles.bodyBold),
              TextSpan(text: "\ncom ${this.qtdAwnserRight} de ${this.qtdQuestions} acertos.", style: AppTextStyles.body),
            ]),
            textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(child: NextButtonWidget.purple(label: "Voltar ao Inicio", onTap: (){ Navigator.pop(context); }),),
      ),
    );
  }
}