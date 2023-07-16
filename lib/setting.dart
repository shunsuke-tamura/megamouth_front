import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('アカウント情報'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.account_circle),
                trailing: const Icon(Icons.keyboard_arrow_right),
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
}
