import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
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
  }//initState

  void _checkLogin() async {

    //QUI POSSO cancellare gli sp 'username'(per la presentazione dell'app)


    //Get the SharedPreference instance and check if the value of the 'username' filed is set or not
    final sp = await SharedPreferences.getInstance();
    if(sp.getString('username') != null){
      //If 'username is set, push the HomePage
      _toHomePage(context);
    }//if
  }//_checkLogin

  Future<String> _loginUser(LoginData data) async {
    if(data.name == 'bug@expert.com' && data.password == '5TrNgP5Wd'){

      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);

      return '';
    } else {
      return 'Wrong credentials';
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
    return MaterialApp(
      //title: 'Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlutterLogin(
        title: 'login_flow',
        onLogin: _loginUser,
        onSignup: _signUpUser,
        onRecoverPassword: _recoverPassword,
        onSubmitAnimationCompleted: () async{
          _toHomePage(context);
        },
      ),
    );
  }
 
  void _toHomePage(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Twitter Demo Home Page')));
  }//_toHomePage
  
} 
  