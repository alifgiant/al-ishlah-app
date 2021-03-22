import 'package:al_ishlah_app/page/main_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Pesantren Al Ishlah',
      theme: CupertinoThemeData(),
      home: MainPage(),
    );
  }
}
