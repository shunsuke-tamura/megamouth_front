import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/common/api_client.dart';
import 'package:megamouth_front/main.dart';
import 'package:settings_ui/settings_ui.dart';

import 'logic/user_provider.dart';

//Setting Screen
class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  //final String message;
  //SecondScreen({required this.message});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(userProvider).name == null) {
      logOut(context);
    }
    final username = ref.watch(userProvider).id;

    Future<Image?> downloadImage = downloadimage(username);
    Image? userImage;
    downloadImage.then((result) {
      userImage = result;
    });

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
                child: _displaySelectionImageOrGrayImage(userImage)),
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

  Widget _displaySelectionImageOrGrayImage(Image? uimage) {
    if (uimage == null) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(233, 251, 240, 240),
          border: Border.all(
            width: 2,
            color: const Color(0xff000000),
          ),
          //borderRadius: BorderRadius.circular(10),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: const Color(0xff000000),
          ),
          //borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: uimage.image,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
  }

  Future<String?> urlimage(String id) async {
    final res = await ApiClient().get(Uri.parse("/user/$id/"), null);
    final parsed = json.decode(res.body).cast<Map<String, String?>>();
    return parsed("image_url");
  }

  Future<Image?> downloadimage(String usernamae) async {
    String? res = await urlimage(usernamae);
    Image? userImage;
    if (res != null) {
      return Image.network(res);
    } else {
      //return userImage;
      return Image.network(
          "https://th.bing.com/th?id=ODL.45f4ccee64ec1e87729cbfc7df25d27f&w=197&h=103&c=7&rs=1&qlt=80&o=6&pid=RichNav");
    }
  }
}
