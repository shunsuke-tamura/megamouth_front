import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import './setting.dart';
import './login.dart';
import './view.dart';
import 'package:camera/camera.dart';
import 'package:megamouth_front/widget/camera.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();
final logger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const ProviderScope(child: MyApp()));
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
        "/login": (context) => const LoginScreen(),
        "/view": (context) => const MyHomePage(title: 'Twitter Demo Home Page'),
        "/setting": (context) => const SettingScreen(),
      },
      //home: const MyHomePage(title: 'Twitter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
