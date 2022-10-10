import 'package:chatting_hub/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);
  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: () {
              AuthController.instance.logOut();
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Text('LogOut'),
            ),
          ),
        ),
      ),
    );
  }
}
