import 'package:flutter/cupertino.dart';

import 'tab_pages/first_page.dart';
import 'tab_pages/messages_page.dart';
import 'tab_pages/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, i){
        return _loadPage(i);
      },
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
      ),
    );
  }

  _loadPage(int index){
    switch(index){
      case 0:
        return FirstPage();
        break;
      case 1:
        return MessagesPage();
        break;
      case 2:
        return SettingsPage();
        break;
      default:
        return FirstPage();
        break;
    }
  }
}
