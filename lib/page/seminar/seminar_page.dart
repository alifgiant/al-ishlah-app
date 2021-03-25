import 'package:flutter/cupertino.dart';

class SeminarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateSeminarPage();
}

class _StateSeminarPage extends State<SeminarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Seminar'),
      ),
      child: Center(
        child: Text('detail Seminar'),
      ),
    );
  }
}
