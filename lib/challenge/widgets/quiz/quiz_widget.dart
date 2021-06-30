import 'package:flutter/material.dart';
import 'package:quizapp/challenge/widgets/awnser/awnser_widget.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {

  final QuestionModel? question;
  final bool isConfirm;
  final ValueChanged<bool>? onSelected;

  const QuizWidget({Key? key, this.question, this.isConfirm = false, this.onSelected}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question!.title!, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for(var i = 0; i < widget.question!.awnsers.length; i++)
            AwnserWidget(awnser: widget.question!.awnsers[i], 
                                  isSelect: indexSelected == i,
                                  onTap: (value) { 
                                            indexSelected = i; 
                                            setState(() { }); 
                                            widget.onSelected!(value); },
                                isConfirm: widget.isConfirm,)
          ,
        ]
      ),
    );
  }
}