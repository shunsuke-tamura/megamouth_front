import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/main.dart';
import 'package:settings_ui/settings_ui.dart';

import 'logic/user_provider.dart';

//Setting Screen
class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  static final Image _image = Image.network(
      "https://th.bing.com/th?id=ODL.45f4ccee64ec1e87729cbfc7df25d27f&w=197&h=103&c=7&rs=1&qlt=80&o=6&pid=RichNav");
  //final String message;
  //SecondScreen({required this.message});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(userProvider).name == null) {
      logOut(context);
    }
    final username = ref.watch(userProvider).id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          CustomSettingsSection(
            child: Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(
                    top: 40, left: 40, right: 40, bottom: 40),
                child: _displaySelectionImageOrGrayImage()),
          ),
          SettingsSection(
            title: const Text('アカウント情報'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.account_circle),
                //trailing: const Icon(Icons.keyboard_arrow_right),
                description: Text(username),
                title: const Text("User name"),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.logout_sharp),
                title: TextButton(
                  onPressed: () => logOut(context),
                  child: const Text("Log out"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void logOut(BuildContext context) async {
    await storage.delete(key: "token");
    // ignore: use_build_context_synchronously
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
  }

  Widget _displaySelectionImageOrGrayImage() {
    if (_image == null) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xffdfdfdf),
          border: Border.all(
            width: 2,
            color: const Color(0xff000000),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color(0xff000000),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: _image.image,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
  }
}
