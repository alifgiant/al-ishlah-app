import 'package:flutter/cupertino.dart';

class DetailDonationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDetailDonationPage();
}

class _StateDetailDonationPage extends State<DetailDonationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Donasi'),
      ),
      child: Center(
        child: Text('detail donasi'),
      ),
    );
  }
}
