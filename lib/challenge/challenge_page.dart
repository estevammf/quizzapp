
import 'package:flutter/material.dart';
import 'package:quizapp/challenge/challenge_controller.dart';
import 'package:quizapp/challenge/widgets/nextbutton/next_button_widget.dart';
import 'package:quizapp/challenge/widgets/questionindicator/question_indicator_widget.dart';
import 'package:quizapp/challenge/widgets/quiz/quiz_widget.dart';
import 'package:quizapp/result/result_page.dart';
import 'package:quizapp/shared/models/quiz_model.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel? quiz;

  const ChallengePage({Key? key, this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = ChallengeController();
  final pageController = PageController();
 
  @override
  void initState(){
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt();
      controller.isConfirm = false;
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold (
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(top: true, child: Column(
          children: [
            IconButton(icon: Icon(Icons.close), onPressed: () { Navigator.pop(context); }),
            ValueListenableBuilder<int>(valueListenable: controller.currentQuestionNotifier, builder: (context, value,_) => 
              QuestionIndicatorWidget(currentQuestion: (value + 1), questionsLength: widget.quiz!.questions!.length,)
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController, 
        children: widget.quiz!.questions!.map((e) =>         
        ValueListenableBuilder<bool>(valueListenable: controller.isConfirmNotifier, builder: (context, value,_) => 
              QuizWidget(question: e, isConfirm: value, onSelected: (bool value) { controller.qtdAwnserRight += (value ? 1 : 0);},)
            ) 
        ).toList(),  
        ),
      bottomNavigationBar: SafeArea(
        bottom:true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Expanded(child: NextButtonWidget.white(label: "Pular", 
              onTap: () { pageController.nextPage(duration: Duration(milliseconds:500), curve: Curves.linear); }
            ,)),
            SizedBox(width:7),
            Expanded(child: NextButtonWidget.green(label: "Confirmar", 
            onTap: () { 
              controller.isConfirm = true;
              Future.delayed(const Duration(seconds: 1),() { 
                ((controller.currentQuestion + 1) == widget.quiz!.questions!.length) ? 
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(title: widget.quiz!.title, qtdQuestions: widget.quiz!.questions!.length, qtdAwnserRight: controller.qtdAwnserRight,))) :
                  pageController.nextPage(duration: Duration(milliseconds:500), curve: Curves.linear); });          
            }
            )),
          ],),
        ),
      ),
    );
  }
}