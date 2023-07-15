import 'package:flutter/material.dart';
import './setting.dart';
import './login.dart';
import './view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      //home: const MyHomePage(title: 'Twitter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}



