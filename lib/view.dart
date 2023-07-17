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
  var isPolling = false;

  @override
  void initState() {
    super.initState();

    isPolling = true;
    startPolling();
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    isPolling = false;
    super.dispose();
  }

  Future<List<Tweet>> fetchTweet() async {
    logger.i('fetch tweet');
    final res = await ApiClient().get(Uri.parse('/post/all'), null);
    final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
    return parsed.map<Tweet>((json) => Tweet.fromJson(json)).toList();
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
      _alertTextlist = await fetchTweet();
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

  Future<void> startPolling() async {
    while (isPolling) {
      _alertTextlist = await fetchTweet();
      setState(() {});
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CameraWidget(
              photoMode: false,
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, 0.9),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    _alertTextlist.length,
                    (index) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                          width: double.infinity,
                          constraints: const BoxConstraints(minHeight: 40),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(97, 221, 225, 247),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('@${_alertTextlist[index].author}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                _alertTextlist[index].content,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
