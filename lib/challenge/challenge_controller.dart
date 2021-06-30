import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;


  final isConfirmNotifier = ValueNotifier<bool>(false);
  bool get isConfirm => isConfirmNotifier.value;
  set isConfirm(bool value) => isConfirmNotifier.value = value;

  int qtdAwnserRight = 0;

}