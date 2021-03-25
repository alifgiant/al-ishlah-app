import 'package:flutter/cupertino.dart';

class DetailSeminarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDetailSeminarPage();
}

class _StateDetailSeminarPage extends State<DetailSeminarPage> {
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
