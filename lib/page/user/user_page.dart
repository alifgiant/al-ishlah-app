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
        trailing: CupertinoButton(
          child: Text('Edit'),
          padding: EdgeInsets.zero,
          onPressed: () {},
        ),
      ),
      child: Material(
        child: ListView(
          children: [
            getProfilePictureSection(),
            Container(height: 26),
            getAccountFormSection(context),
            Container(height: 26),
            getAboutAppSection(context),
            Container(height: 26),
            getLogoutButton(),
          ],
        ),
      ),
    );
  }

  Padding getLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CupertinoButton(
        child: Text('Log Out'),
        padding: EdgeInsets.zero,
        color: CupertinoColors.destructiveRed,
        onPressed: () {},
      ),
    );
  }

  Widget getAboutAppSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tentang Aplikasi', style: TextStyle(fontSize: 18)),
              Text(
                'v0.1',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
            ],
          ),
          Container(height: 6),
          ListTile(
            title: Text('FAQ'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: CupertinoColors.secondaryLabel),
            ),
            onTap: () {},
            tileColor: CupertinoColors.white,
            dense: true,
          ),
          Container(height: 6),
          ListTile(
            title: Text('Kebijakan Layanan'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: CupertinoColors.secondaryLabel),
            ),
            onTap: () {},
            tileColor: CupertinoColors.white,
            dense: true,
          ),
          Container(height: 6),
          ListTile(
            title: Text('Hubungi Kami'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: CupertinoColors.secondaryLabel),
            ),
            onTap: () {},
            tileColor: CupertinoColors.white,
            dense: true,
          ),
        ],
      ),
    );
  }

  Widget getAccountFormSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(fontSize: 16),
          ),
          Container(height: 6),
          CupertinoTextField(
            placeholder: 'Email',
            padding: const EdgeInsets.all(12),
          ),
          Container(height: 12),
          Text(
            'Phone Number',
            style: TextStyle(fontSize: 16),
          ),
          Container(height: 6),
          CupertinoTextField(
            placeholder: 'Phone Number',
            padding: const EdgeInsets.all(12),
          ),
        ],
      ),
    );
  }

  Column getProfilePictureSection() {
    return Column(
      children: [
        Container(height: 6),
        Padding(
          padding: const EdgeInsets.all(12),
          child: CircleAvatar(
            child: Icon(CupertinoIcons.person, size: 42),
            radius: 42,
          ),
        ),
        Text(
          'Muhammad Alif Akbar',
          style: TextStyle(fontSize: 26),
        ),
      ],
    );
  }
}
