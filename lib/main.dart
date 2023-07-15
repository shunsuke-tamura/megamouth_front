import 'package:flutter/material.dart';
import './setting.dart';

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
      home: const MyHomePage(title: 'Twitter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //tweet dialog
  void showdialog(){

    
  }

  

  @override
  Widget build(BuildContext context) {
    var _editText = '';
    var _alertText = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          // setting button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {return SettingScreen();} ),
              );
            }, 
            iconSize: 50,
            icon: Icon(Icons.settings)
          ),
        ],
      ),
      //tweet button
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title :Text("Hello !"),
              content: TextField(
                onChanged: (value) {
                  setState(() {
                  _editText = value;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //画面を閉じる
                  },
                  child: Text('キャンセル'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _alertText = _editText; //編集用を保存用に
                    });
                  Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            )
          );
        },
        tooltip: 'Increment',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
