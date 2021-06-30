
import 'package:flutter/material.dart';
import 'package:quizapp/home/home_repository.dart';
import 'package:quizapp/home/home_state.dart';
import 'package:quizapp/shared/models/quiz_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  final repository = HomeRepository();

  late List<QuizModel> quizzes;

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }

}