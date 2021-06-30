import 'package:flutter/material.dart';
import 'package:quizapp/login/login_page.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/user_model.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
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
    }

  @override
  Widget build(BuildContext context) {
    if( _user != null) {
      return ListView(
        children: [
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {
              UserModel.clear();
              Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ]
      );
    } else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),)),
      );
    }
  }
}