import 'package:flutter/material.dart';
import 'package:megamouth_front/login.dart';
import 'package:megamouth_front/main.dart';
import 'package:settings_ui/settings_ui.dart';

//Setting Screen
class SettingScreen extends StatelessWidget {
  //final String message;
  //SecondScreen({required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('アカウント情報'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.account_circle),
                title: Text('User Name'),
                value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.email),
                title: Text('Emial'),
                value: Text(
                    'oooooooooooooooooooooooooooooooooooooooooooooooooooooo'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.logout_sharp),
                title: TextButton(
                  onPressed: () => logOut(context),
                  child: Text("Log out"),
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
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
