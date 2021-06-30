import 'dart:convert';

import 'package:quizapp/shared/utils/app_prefs.dart';


class UserModel {
  String? name;
  String? email;
  String? token;
  String? picture;

  UserModel(this.name, this.email, this.token, {this.picture = ""});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'image': picture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'],
      map['email'],
      map['token'],
      picture: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  save() => AppPrefs.setString("user.prefs", toJson());  

  static clear() => AppPrefs.setString("user.prefs", ""); 

  static Future<UserModel?> get() async {
    String jsonUser = await AppPrefs.getString("user.prefs");
    if(jsonUser.isEmpty) {
      return null;
    }
    Map map = json.decode(jsonUser);
    UserModel user = UserModel.fromMap(map as Map<String, dynamic>);
    return user;
  }
}
