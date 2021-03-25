import 'package:flutter/cupertino.dart';

class TrxDetailDonationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateTrxDetailDonationPage();
}

class _StateTrxDetailDonationPage extends State<TrxDetailDonationPage> {
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
