import 'package:flutter/cupertino.dart';

class TrxDetailSeminarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrxDetailSeminarPageState();
}

class _TrxDetailSeminarPageState extends State<TrxDetailSeminarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Transaksi Seminar'),
      ),
      child: Center(
        child: Text('detail transaksi seminar'),
      ),
    );
  }
}
