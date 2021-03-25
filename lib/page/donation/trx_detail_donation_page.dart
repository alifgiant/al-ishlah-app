import 'package:flutter/cupertino.dart';

class TrxDetailDonationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrxDetailDonationPageState();
}

class _TrxDetailDonationPageState extends State<TrxDetailDonationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Transaksi Donasi'),
      ),
      child: Center(
        child: Text('detail transaksi donasi'),
      ),
    );
  }
}
