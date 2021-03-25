import 'package:al_ishlah_app/page/tab_data.dart';
import 'package:al_ishlah_app/page/donation/trx_list_donation_page.dart';
import 'package:al_ishlah_app/page/seminar/trx_list_seminar_page.dart';
import 'package:flutter/cupertino.dart';

class TransactionTab implements TabData {
  @override
  Widget content = TransactionPage();

  @override
  Widget icon = Icon(CupertinoIcons.square_list);

  @override
  String label = 'Transaction';
}

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int selectedTab = 0;
  final PageController _pageController = PageController();
  final List<TabData> _tabs = [
    TrxListDonationTab(),
    TrxListSeminarTab(),
  ];

  void updateIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 600),
      curve: Curves.ease,
    );
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CupertinoSlidingSegmentedControl(
            children: _tabs
                .asMap()
                .map((key, value) => MapEntry(value.label, Text(value.label))),
            groupValue: _tabs[selectedTab].label,
            onValueChanged: (String? str) {
              final newIndex =
                  _tabs.indexWhere((element) => element.label == str);
              updateIndex(newIndex);
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (i) => updateIndex(i),
              children: _tabs.map((e) => e.content).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
