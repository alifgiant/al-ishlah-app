import 'package:al_ishlah_app/page/seminar/trx_detail_seminar_page.dart';
import 'package:al_ishlah_app/page/tab_data.dart';
import 'package:al_ishlah_app/utils/date_format_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrxListSeminarTab implements TabData {
  @override
  Widget content = TrxListSeminarPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Seminar';
}

class TrxListSeminarPage extends StatefulWidget {
  @override
  _TrxListSeminarPageState createState() => _TrxListSeminarPageState();
}

class _TrxListSeminarPageAction {
  void goToTrxDetailPage(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => TrxDetailSeminarPage('asdas')),
    );
  }
}

class _TrxListSeminarPageState extends State<TrxListSeminarPage> {
  final _TrxListSeminarPageAction action = _TrxListSeminarPageAction();

  @override
  Widget build(BuildContext context) {
    final double padSize = 16;
    final boxSize = MediaQuery.of(context).size.width - (padSize * 2);

    return Material(
      child: ListView.builder(
        itemCount: 21,
        itemBuilder: (ctx, i) {
          return InkWell(
            onTap: () => action.goToTrxDetailPage(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: boxSize / 3,
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
                            '${DateTime.now().formatNoDay(withHour: true)}',
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
