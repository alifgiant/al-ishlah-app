import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

class UserTab implements Tab {
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
    return Center(
      child: Text('User'),
    );
  }
}
