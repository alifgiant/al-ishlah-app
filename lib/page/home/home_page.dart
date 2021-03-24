import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab implements TabData {
  @override
  Widget content = HomePage();

  @override
  Widget icon = Icon(CupertinoIcons.moon_circle_fill);

  @override
  String label = 'Home';
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double padSize = 16;
    final boxSize = MediaQuery.of(context).size.width - (padSize * 2);

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(padSize),
        children: [
          Text(
            'Selamat Datang Alif,',
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          Container(height: 26),
          getDonationSection(boxSize),
          Container(height: 26),
          getSeminarSection(boxSize),
        ],
      ),
    );
  }

  Widget getDonationSection(double boxSize) {
    final halfBox = (boxSize - 16) / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Yuk Donasi!',
          style: TextStyle(fontSize: 24),
        ),
        Container(height: 6),
        Text(
          'Mari sisihkan sebagian harta anda untuk berdonasi bagi pengembangan umat',
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(fontWeight: FontWeight.w300),
        ),
        Container(height: 12),
        Row(
          children: [
            SizedBox(
              width: halfBox,
              height: halfBox,
              child: Container(
                child: Icon(
                  Icons.festival,
                  size: 42,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Container(width: 16),
            SizedBox(
              width: halfBox,
              height: halfBox,
              child: Container(
                child: Icon(
                  Icons.face,
                  size: 42,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget getSeminarSection(double boxSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Belajar Bareng',
          style: TextStyle(fontSize: 24),
        ),
        Container(height: 6),
        Text(
          'Ayo ikuti kelas Seminar online dari kami dan berbagai partner yang akan menambah ilmu anda sekaligus beramal.',
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(fontWeight: FontWeight.w300),
        ),
        Container(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: boxSize,
                        decoration: BoxDecoration(
                          color: Colors.amber,
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
                  Text(
                    'Belajar bersama pak gitu, kelas selama 3 hari 3 malam.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(height: 4),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
