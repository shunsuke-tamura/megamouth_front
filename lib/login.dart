import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  //final String message;
  //SecondScreen({required this.message});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before rendering the login page
    _checkLogin();
  } //initState

  void _checkLogin() async {
    if (await storage.read(key: "token") != null) {
      _toHomePage(context);
    }
  } //_checkLogin

  Future<String?>? _loginUser(LoginData data) async {
    final response = await ApiClient().post(Uri.parse("/user/login"),
        json.encode({'id': data.name, 'password': data.password}));
    if (response.statusCode != 200) {
      return response.body;
    } else {
      await storage.write(
          key: "token",
          value: (json.decode(response.body) as Map<String, dynamic>)["jwt"]);
      return null;
    }
  }

  // _loginUser
  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  }

  // _signUpUser
  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  }
  // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'login_flow',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        _toHomePage(context);
      },
      messages: LoginMessages(userHint: "User"),
      userType: LoginUserType.text,
      userValidator: (_) => null,
    );
  }

  void _toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const MyHomePage(title: 'Twitter Demo Home Page')));
  } //_toHomePage
}
