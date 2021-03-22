import 'package:al_ishlah_app/page/main_tab.dart';
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
  final List<String> _tabKey = ['donasi', 'seminar'];
  final PageController _pageController = PageController();
  int selectedTab = 0;

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
            children: {
              _tabKey[0]: Text('Donation'),
              _tabKey[1]: Text('Seminar'),
            },
            groupValue: _tabKey[selectedTab],
            onValueChanged: (String? str) {
              final newIndex = _tabKey.indexOf(str!);
              updateIndex(newIndex);
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (i) => updateIndex(i),
              children: [
                Center(child: Text('Donasi')),
                Center(child: Text('Seminar'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
