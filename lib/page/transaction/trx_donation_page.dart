import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Material(
      child: ListView.builder(
        itemCount: 21,
        itemBuilder: (ctx, i) {
          final time = DateFormat('dd-MMM-yyyy HH:mm');
          return ListTile(
            leading: Container(
              color: Colors.blue,
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
                    letterSpacing: 2,
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
