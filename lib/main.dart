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
      debugShowCheckedModeBanner: false,
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

  //tweet sentence
  var _editText = '';
  //TL sentence
  var _alertTextlist = <String>[];

  //tweet保存
  void _addtweet(){
    setState(() {
      _alertTextlist.add(_editText); //編集用を保存用に
    });
  }

  //TLコンテナのスクロールバー調整
  ScrollController _scrollController = ScrollController();

  void initStateContainer() {
    //double nowOffset = _scrollController.offset;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, 
      duration: Duration(seconds: 1), 
      curve: Curves.bounceIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        actions: <Widget>[
          // setting button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {return SettingScreen();} ),
              );
            }, 
            iconSize: 40,
            icon: Icon(Icons.settings)
          ),
        ],
      ),
      
      //Time Line
      body: Center(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(var i=0; i < _alertTextlist.length; i++)
                    Text(
                      _alertTextlist[i],
                    ),
                ],
              ),
            ),
          ),
        ),  
      ),
      //tweet button
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title :Text("コメント"),
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
                  onPressed: (){
                    _addtweet();
                    Navigator.pop(context);
                    initStateContainer();
                  },
                  child: Text('投稿する'),
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
