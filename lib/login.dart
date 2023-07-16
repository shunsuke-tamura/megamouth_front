import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/logic/user_provider.dart';
import 'package:megamouth_front/main.dart';
import 'package:megamouth_front/model/login_res.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  //final String message;
  //SecondScreen({required this.message});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before rendering the login page
    _checkLogin();
  } //initState

  void _checkLogin() async {
    if (await storage.read(key: "token") != null &&
        ref.read(userProvider).id != '') {
      _toHomePage();
    }
  } //_checkLogin

  Future<String?>? _loginUser(LoginData data) async {
    final response = await ApiClient().post(Uri.parse("/user/login"),
        json.encode({'id': data.name, 'password': data.password}));
    if (response.statusCode != 200) {
      return response.body;
    } else {
      final res =
          LoginRes.fromJson(json.decode(response.body) as Map<String, dynamic>);
      await storage.write(key: "token", value: res.jwt);
      ref.read(userProvider.notifier).state = res.user;
      return null;
    }
  }

  // _loginUser
  Future<String?>? _signUpUser(SignupData data) async {
    Navigator.of(context).pushNamed('/image_upload');
    return null;
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
        _toHomePage();
      },
      messages: LoginMessages(userHint: "User"),
      userType: LoginUserType.text,
      userValidator: (_) => null,
      passwordValidator: (value) => null,
    );
  }

  void _toHomePage() {
    Navigator.of(context).pushReplacementNamed("/view");
  } //_toHomePage
}
