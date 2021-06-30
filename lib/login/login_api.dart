import 'dart:convert';

import 'package:quizapp/shared/api/api_request.dart';
import 'package:quizapp/shared/api/api_response.dart';
import 'package:quizapp/shared/models/user_model.dart';

class LoginApi {
  static Future<ApiResponse<UserModel>> login(String login, String password) async {
    try {
      var params = {
        "login": login,
        "password": password
      };
      var response = await ApiRequest.post(params, 'login/authenticate/');
      Map? mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = UserModel.fromMap(mapResponse!["data"] as Map<String, dynamic>);
        user.save();
        return ApiResponse.ok(user);
      } else {
        return ApiResponse.error(mapResponse!["errors"]["Mensagens"][0]);
      }
    } catch(error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
