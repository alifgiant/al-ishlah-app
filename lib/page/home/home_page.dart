import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

class HomeTab implements Tab {
  @override
  Widget content = HomePage();

  @override
  Widget icon = Icon(CupertinoIcons.moon_circle_fill);

  @override
  String label = 'Home';
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}
