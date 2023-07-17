import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/logic/user_provider.dart';
import 'package:megamouth_front/main.dart';
import 'package:megamouth_front/model/create_user_req.dart';
import 'package:megamouth_front/model/login_res.dart';
import 'package:megamouth_front/model/user.dart';

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
    if (data.name == null ||
        data.name == '' ||
        data.password == null ||
        data.password == '') {
      return 'Please enter your id and password';
    }
    if (await idCheck(data.name!)) {
      return 'This id is already use';
    }
    if (!mounted) return 'Errors occurred';
    ref.read(userProvider.notifier).state = User(id: data.name!);
    List<String>? images = (await Navigator.of(context)
        .pushNamed('/image_upload')) as List<String>;
    final body = CreateUserReq(
        id: data.name!, name: null, password: data.password!, imageUrl: images);
    final res = await ApiClient()
        .post(Uri.parse('/user/create'), json.encode(body.toJson()));
    if (res.statusCode != 200) {
      logger.e('Failed to signUp');
      logger.e('StatusCode: ${res.statusCode}');
      logger.e('message: ${res.body}');
      logger.e('body: ${json.encode(body.toJson())}');
      return 'Failed to signUp';
    } else {
      logger.i('success create user');
      final token = (json.decode(res.body) as Map<String, dynamic>)["jwt"];
      if (token == null) {
        logger.e('Cannot get jwt');
        return 'Failed to signUp';
      }
      await storage.write(
          key: "token",
          value: (json.decode(res.body) as Map<String, dynamic>)["jwt"]);
      return null;
    }
  }

  Future<bool> idCheck(String id) async {
    final response = await ApiClient()
        .get(Uri.parse("/user/is_used"), Uri.parse('/$id'), useToken: false);
    final resMap = json.decode(response.body) as Map<String, dynamic>;
    return resMap['message'];
  }

  // _signUpUser
  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  }
  // _recoverPassword

  @override
  Widget build(BuildContext context) {
    //UserFormField(keyName: "", Icon?: Icons.account_circle);
    return FlutterLogin(
      title: ('login_flow'),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        _toHomePage();
      },
      messages: LoginMessages(userHint: "User"),
      userType: LoginUserType.name,
      // userType: LoginUserType.text,
      userValidator: (_) => null,
      passwordValidator: (value) => null,
      scrollable: true,
    );
  }

  void _toHomePage() {
    Navigator.of(context).pushReplacementNamed("/view");
  } //_toHomePage
}
