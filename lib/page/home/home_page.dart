import 'package:al_ishlah_app/page/donation/detail_donation_page.dart';
import 'package:al_ishlah_app/page/seminar/detail_seminar_page.dart';
import 'package:al_ishlah_app/page/tab_data.dart';
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

class _HomePageAction {
  void goToDonationBuildingDetailPage(BuildContext context) =>
      goToDonationDetailPage(context, 'building');
  void goToDonationStudyDetailPage(BuildContext context) =>
      goToDonationDetailPage(context, 'study');

  void goToDonationDetailPage(BuildContext context, String type) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => DetailDonationPage()),
    );
  }

  void goToSeminarDetailPage(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => DetailSeminarPage()),
    );
  }
}

class _HomePageState extends State<HomePage> {
  static const double padSize = 16;
  static const double padSizeHalf = padSize / 2;

  final action = _HomePageAction();

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width - (padSize * 2);
    return SafeArea(
      child: Material(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padSize,
                vertical: padSizeHalf,
              ),
              child: Text(
                'Selamat Datang Alif,',
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
            ),
            getDonationSection(boxSize),
            Container(height: 12),
            getSeminarSection(boxSize),
          ],
        ),
      ),
    );
  }

  Widget getDonationSection(double boxSize) {
    final halfBox = (boxSize - 16) / 2;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padSize,
        vertical: padSizeHalf,
      ),
      child: Column(
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
          getDonationOption(halfBox),
        ],
      ),
    );
  }

  Row getDonationOption(double halfBox) {
    return Row(
      children: [
        Material(
          color: Colors.amber,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: () => action.goToDonationBuildingDetailPage(context),
            child: SizedBox(
              width: halfBox,
              height: halfBox,
              child: Icon(
                Icons.festival,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(width: 16),
        Material(
          color: Colors.amber,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: () => action.goToDonationStudyDetailPage(context),
            child: SizedBox(
              width: halfBox,
              height: halfBox,
              child: Icon(
                Icons.face,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getSeminarSection(double boxSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: padSize,
            vertical: padSizeHalf,
          ),
          child: Column(
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
            ],
          ),
        ),
        seminarContents(boxSize),
      ],
    );
  }

  Widget seminarContents(double boxSize) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (ctx, i) {
        return InkWell(
          onTap: () => action.goToSeminarDetailPage(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padSize,
              vertical: padSizeHalf,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSeminarBanner(boxSize),
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
          ),
        );
      },
    );
  }

  Stack getSeminarBanner(double boxSize) {
    return Stack(
      children: [
        Container(
          height: boxSize / 3,
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
    );
  }
}
