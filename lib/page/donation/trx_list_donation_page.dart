import 'package:al_ishlah_app/page/donation/trx_detail_donation_page.dart';
import 'package:al_ishlah_app/page/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrxListDonationTab implements TabData {
  @override
  Widget content = TrxListDonationPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Donation';
}

class TrxListDonationPage extends StatefulWidget {
  @override
  _TrxListDonationPageState createState() => _TrxListDonationPageState();
}

class _TrxListDonationPageAction {
  void goToTrxDetailPage(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => TrxDetailDonationPage()),
    );
  }
}

class _TrxListDonationPageState extends State<TrxListDonationPage> {
  final _TrxListDonationPageAction action = _TrxListDonationPageAction();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 21,
        itemBuilder: (ctx, i) {
          final time = DateFormat('dd-MMM-yyyy HH:mm');
          return ListTile(
            onTap: () => action.goToTrxDetailPage(context),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.festival, color: Colors.white),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembangunan - $i',
                  style: TextStyle(fontSize: 16),
                ),
                Container(height: 2),
                Text(
                  '${time.format(DateTime.now())}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            trailing: Text(
              'Rp. 500.000',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
