import 'dart:async';

import 'package:quizapp/login/login_api.dart';
import 'package:quizapp/shared/api/api_response.dart';
import 'package:quizapp/shared/models/user_model.dart';
import 'package:quizapp/shared/utils/app_simple_bloc.dart';

class LoginBloc extends AppSimpleBloc<bool> {  
  Future<ApiResponse<UserModel>> login(String login, String senha) async {  
    add(true);  
    ApiResponse response = await LoginApi.login(login, senha);
    add(false);
    return response as FutureOr<ApiResponse<UserModel>>;
  }
}