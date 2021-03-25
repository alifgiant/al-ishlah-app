import 'package:flutter/cupertino.dart';

class DonationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDonationPage();
}

class _StateDonationPage extends State<DonationPage> {
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
