import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  void _checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.getString('username') != null) {
      _toHomePage(context);
    }
  }

  Future<String> _loginUser(LoginData data) async {
    if (data.name == 'bug@expert.com' && data.password == '5TrNgP5Wd') {
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);

      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Log In',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        _toHomePage(context);
      },
      messages: LoginMessages(
        userHint: "User ID / email",
      ),
      theme: LoginTheme(
        titleStyle: const TextStyle(fontFamily: "Poppins"),
        bodyStyle: const TextStyle(fontFamily: "Poppins"),
        textFieldStyle: const TextStyle(fontFamily: "Poppins"),
      ),
    );
  }

  void _toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  } // build
} // LoginScreen