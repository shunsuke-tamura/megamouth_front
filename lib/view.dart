import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/logic/user_provider.dart';
import 'package:megamouth_front/main.dart';
import 'package:megamouth_front/model/tweet.dart';
import 'package:megamouth_front/widget/camera.dart';
import './setting.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> {
  //tweet sentence
  var _editText = '';
  //TL sentence
  var _alertTextlist = <Tweet>[];

  @override
  void initState() {
    super.initState();
    ApiClient().get(Uri.parse('/post/all'), null).then((res) {
      final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
      _alertTextlist =
          parsed.map<Tweet>((json) => Tweet.fromJson(json)).toList();
      logger.d('all tweet::$_alertTextlist');
      setState(() {});
    });
  }

  //tweet保存
  void _addtweet() async {
    final body = {'content': _editText, 'user_id': ref.read(userProvider).id};
    final res =
        await ApiClient().post(Uri.parse('/post/create'), json.encode(body));
    if (res.statusCode != 200) {
      logger.e('Faild to POST /post/create');
      logger.e('RequestBody: ${json.encode(body)}');
      logger.e('StatusCode: ${res.statusCode}');
      logger.e('message: ${res.body}');
    } else {
      logger.i('Success to POST /post/create');
      final res = await ApiClient().get(Uri.parse('/post/all'), null);
      final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
      _alertTextlist =
          parsed.map<Tweet>((json) => Tweet.fromJson(json)).toList();
      _editText = '';
      setState(() {});
    }
  }

  //TLコンテナのスクロールバー調整
  final ScrollController _scrollController = ScrollController();

  void initStateContainer() {
    //double nowOffset = _scrollController.offset;
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //ヘッダー
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        actions: <Widget>[
          // setting button
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SettingScreen();
                  }),
                );
              },
              iconSize: 40,
              icon: const Icon(Icons.settings)),
        ],
      ),

      //Time Line
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CameraWidget(),
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < _alertTextlist.length; i++)
                        Text(
                          _alertTextlist[i].content,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      //tweet button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text("コメント"),
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
                        child: const Text('キャンセル'),
                      ),
                      TextButton(
                        onPressed: () {
                          _addtweet();
                          Navigator.pop(context);
                          initStateContainer();
                        },
                        child: const Text('投稿する'),
                      ),
                    ],
                  ));
        },
        tooltip: 'Increment',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
