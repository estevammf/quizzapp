import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/home/home_page.dart';
import 'package:quizapp/login/login_bloc.dart';
import 'package:quizapp/shared/api/api_response.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/shared/utils/app_toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tPassword = TextEditingController();

  final _bloc = LoginBloc();

  bool? _rememberMe = false;
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);

    Future<UserModel?> future = UserModel.get();
    future.then((UserModel? user) {
      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage(user: user);
        }));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: ListView(
          children: [
            Center(
                child: Image.asset(
              AppImages.logoLogin,
              height: 100,
            )),
            SizedBox(height: 30.0),
            Text(
              'Login',
              style: AppTextStyles.loginLabelStyle,
            ),
            SizedBox(height: 10.0),
            _text(
              "Digite o Login",
              false,
              _tLogin,
              Icon(Icons.mail, color: AppColors.blue),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 10.0),
            Text(
              'Senha',
              style: AppTextStyles.loginLabelStyle,
            ),
            SizedBox(height: 10.0),
            _text(
              "Digite a Senha",
              true,
              _tPassword,
              Icon(Icons.lock, color: AppColors.blue),
            ),
            SizedBox(height: 20),
            // _esqueciSenhaBtn(),
            // _lembremeCheckbox(),
            _button()
          ],
        ),
      ),
    );
  }

  _lembremeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: AppColors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: AppColors.green,
              activeColor: AppColors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text('Lembre-me', style: AppTextStyles.loginLabelStyle),
        ],
      ),
    );
  }

  _esqueciSenhaBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 0.0),
        child: ElevatedButton(
          onPressed: () => print(''),
          child: Text('Esqueci a senha', style: AppTextStyles.loginLabelStyle),
        ),
      ),
    );
  }

  _text(
    String hintText,
    bool obscure,
    TextEditingController controller,
    Widget prefixIcon, {
    TextInputAction? textInputAction,
  }) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: AppTextStyles.loginBoxDecorationStyle,
      height: 60.0,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        textInputAction: textInputAction,
        style: TextStyle(
          color: AppColors.blue,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(
              fontSize: 14,
              color: AppColors.black54,
            )),
      ),
    );
  }

  _button() {
    return StreamBuilder<bool>(
        stream: _bloc.stream,
        initialData: false,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: _onClickLogin,
                  child: snapshot.data!
                      ? Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ))
                      : Text(
                          "LOGIN",
                          style: AppTextStyles.loginButtonTextStyle,
                        ),
                ),
              ),
            ),
          );
        });
  }

  _onClickLogin() async {
    String? msgError = _validateLogin(_tLogin.text);
    if (msgError != null) {
      AppToast.showToastError(msgError, fToast);
      return;
    }

    msgError = _validateSenha(_tPassword.text);
    if (msgError != null) {
      AppToast.showToastError(msgError, fToast);
      return;
    }

    ApiResponse response = await _bloc.login(_tLogin.text, _tPassword.text);

    if (response.ok) {
      AppToast.showToastSuccess("Login realizado com sucesso.", fToast);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else {
      AppToast.showToastError(response.msg, fToast);
    }
  }

  String? _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o Login !";
    }
    if (text.length < 5) {
      return "O login precisa ter pelo menos 5 digitos.";
    }
    return _validateEmail(text);
  }

  String? _validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value) || value == null)
      return 'E-mail inválido !';
    else
      return null;
  }

  String? _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a Senha !";
    }
    if (text.length < 6) {
      return "A senha precisa ter pelo menos 6 digitos.";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
