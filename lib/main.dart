import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './setting.dart';
import './login.dart';
import './view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:megamouth_front/widgets/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  FlutterSecureStorage storage = const FlutterSecureStorage();
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
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        // useMaterial3: true,
      ),
      // home: const LoginScreen(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/view": (context) => MyHomePage(title: 'Twitter Demo Home Page'),
        "/setting": (context) => SettingScreen(),
      },
      //home: const MyHomePage(title: 'Twitter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
