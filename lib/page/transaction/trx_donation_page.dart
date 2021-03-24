import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

class TrxDonationTab implements TabData {
  @override
  Widget content = TrxDonationPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Donation';
}

class TrxDonationPage extends StatefulWidget {
  @override
  _TrxDonationPageState createState() => _TrxDonationPageState();
}

class _TrxDonationPageState extends State<TrxDonationPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Donasi'));
  }
}
