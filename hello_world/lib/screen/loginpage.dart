import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hello_world/screen/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userid = "";
  String psw = "";

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
    if ( //data.name == 'davide@unipd.com' && data.password == 'Password1' ||
        data.name == userid && data.password == psw) {
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);

      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    userid = data.name!;
    psw = data.password!;
    return 'you can now logging in';
    //return 'To be implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    if (email == userid) {
      return 'Your password is: $psw';
    } else {
      return 'Wrong email';
    }
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Log in',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        _toWelcomePage(context);
      },
      messages: LoginMessages(
        userHint: "User ID / email",
      ),
      theme: LoginTheme(
        titleStyle: const TextStyle(fontFamily: "Poppins"),
        bodyStyle: const TextStyle(fontFamily: "Poppins"),
        textFieldStyle: const TextStyle(fontFamily: "Poppins"),
      ),
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 500),
            child: TextButton(
                onPressed: () {
                  _toWelcomePage(context);
                },
                child: const Text(
                  'DO IT LATER',
                  style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
                )))
      ],
    );
  }

  void _toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(
              presname: "",
              name1: "",
              surname1: "",
              height1: "",
              weight1: "",
              age1: "",
              gender1: "",
            )));
  }

  void _toWelcomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()));
  } // build
} // LoginScreen