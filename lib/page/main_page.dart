import 'package:al_ishlah_app/page/home/home_page.dart';
import 'package:al_ishlah_app/page/user/user_page.dart';
import 'package:al_ishlah_app/page/transaction/transaction_page.dart';
import 'package:al_ishlah_app/page/main_tab.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final tabs = <Tab>[
    HomeTab(),
    TransactionTab(),
    UserTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs
            .map<BottomNavigationBarItem>(
              (tab) => BottomNavigationBarItem(
                icon: tab.icon,
                label: tab.label,
              ),
            )
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) => tabs[index].content,
    );
  }
}
