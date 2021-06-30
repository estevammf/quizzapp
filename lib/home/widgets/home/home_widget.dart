import 'package:flutter/material.dart';
import 'package:quizapp/challenge/challenge_page.dart';
import 'package:quizapp/home/home_controller.dart';
import 'package:quizapp/home/widgets/appbar/app_bar_widget.dart';
import 'package:quizapp/home/widgets/levelbutton/level_button_widget.dart';
import 'package:quizapp/home/widgets/quizcard/quiz_card_widget.dart';
import 'package:quizapp/shared/layout/app_colors.dart';
import 'package:quizapp/shared/models/user_model.dart';

import '../../home_state.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeWidget> {
  
  final controller = HomeController();
  UserModel? _user;
  
  @override
  void initState() {
      super.initState();
      Future<UserModel?> future = UserModel.get();
      future.then((UserModel? user){
        if(user != null) {
          _user = user;
          setState(() { });
        }
      });
      controller.getQuizzes();
      controller.stateNotifier.addListener(() { setState(() { }); });
    }

  @override
  Widget build(BuildContext context) {

    if(controller.state == HomeState.success && _user != null) {
      return homeScaffold(context);
    } else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),)),
      );
    }
  }

  Scaffold homeScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(user: _user!),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: controller.quizzes.map((e) => 
                                                        QuizCardWidget(
                                                          title: e.title, 
                                                          image: e.imagem, 
                                                          questionAnswered: e.questionAnswered, 
                                                          questionLength: e.questions!.length,
                                                          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(quiz: e,))); }
                                                          )).toList(),
                  ) 
                )
            ],
          ),
      ),
    );
  }
}