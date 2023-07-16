import 'package:flutter/material.dart';
import 'package:megamouth_front/main.dart';
import 'package:settings_ui/settings_ui.dart';

import 'logic/user_provider.dart';

//Setting Screen
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  //final String message;
  //SecondScreen({required this.message});
  @override
  Widget build(BuildContext context) {
    if (userProvider.name == null) {
      Navigator.of(context).pushReplacementNamed("/login");
    }

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
                  title: const Text('User name'),
                  value: Text(userProvider.name!)),
              SettingsTile.navigation(
                leading: const Icon(Icons.email),
                title: const Text('Emial'),
                value: const Text(
                    'oooooooooooooooooooooooooooooooooooooooooooooooooooooo'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable custom theme'),
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
