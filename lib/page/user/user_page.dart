import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTab implements TabData {
  @override
  Widget content = UserPage();

  @override
  Widget icon = Icon(CupertinoIcons.person);

  @override
  String label = 'User';
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Akun Kamu'),
        leading: CupertinoButton(
          child: Text('Log Out'),
          padding: EdgeInsets.zero,
          onPressed: () {},
        ),
        trailing: CupertinoButton(
          child: Text('Edit'),
          padding: EdgeInsets.zero,
          onPressed: () {},
        ),
      ),
      child: Material(
        child: ListView(
          children: [
            // Row(
            //   children: [
            //     // CircleAvatar(
            //     //   child: Icon(CupertinoIcons.iconFontPackage),
            //     // ),
            //   ],
            // ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(CupertinoIcons.person),
              ),
              title: Text('Muhammad Alif'),
            ),
            Center(child: Text('User')),
          ],
        ),
      ),
    );
  }
}
