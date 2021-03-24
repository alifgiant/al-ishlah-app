import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

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
    return ListView.builder(
      itemCount: 21,
      itemBuilder: (ctx, i) {
        return Center(
          child: Text('Seminar $i'),
        );
      },
    );
  }
}
