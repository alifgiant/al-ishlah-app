import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrxSeminarTab implements TabData {
  @override
  Widget content = TrxSeminarPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Seminar';
}

class TrxSeminarPage extends StatefulWidget {
  @override
  _TrxSeminarPageState createState() => _TrxSeminarPageState();
}

class _TrxSeminarPageState extends State<TrxSeminarPage> {
  @override
  Widget build(BuildContext context) {
    final double padSize = 16;
    final boxSize = MediaQuery.of(context).size.width - (padSize * 2);

    return Material(
      child: ListView.builder(
        itemCount: 21,
        itemBuilder: (ctx, i) {
          final time = DateFormat('dd-MMM-yyyy HH:mm');
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: boxSize,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          CupertinoIcons.pano,
                          size: 42,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '3 hari lagi',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Container(height: 4),
                  Text(
                    'Belajar Online Marketing #$i',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dibeli Tanggal'),
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
                      Text(
                        'Rp. 500.000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
