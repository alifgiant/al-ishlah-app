import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

class TransactionTab implements Tab {
  @override
  Widget content = TransactionPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Transaction';
}

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transaction'),
    );
  }
}
