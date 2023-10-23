import 'package:flutter/material.dart';
import 'package:talentsync/screens/admin_main_screen.dart';
import 'screens/admin_analytics_screen.dart';
import 'screens/admin_candidates_screen.dart';
import 'screens/admin_messages_screen.dart';
import 'screens/admin_settings_screen.dart';

class Navigation extends StatefulWidget {
  static const routeName = '/navigation';
  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  static GlobalKey<NavigationState> globalKey =
      new GlobalKey<NavigationState>();

  // BottomNavigationBar get navigationBar {
  //   return NavigationState.globalKey.currentWidget as BottomNavigationBar;
  // }

  int currentIndex = 0;
  bool _isLoading = true;

  List<Widget> screens = [
    AdminMainScreen(),
    AdminCandidatesScreen(),
    AdminAnalyticsScreen(),
    AdminMessageScreen(),
    AdminSettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Container(
          width: 200,
          height: double.infinity,
          color: Colors.yellow,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: navItem(Icons.home_rounded, 'Dashboard',currentIndex==0 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: navItem(Icons.home_rounded, 'Dashboard',currentIndex==1 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: navItem(Icons.abc, 'Dashboard',currentIndex==2 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: navItem(Icons.abc, 'Dashboard',currentIndex==3 ? true : false)),
            ],
          ),
        ),
        screens[currentIndex]
      ]),
    );
  }
}

Container navItem(IconData icon, String text, bool active) {
  return Container(
    color: active ? Colors.blue : Colors.transparent,
    child: Row(
      children: [Icon(icon), SizedBox(width: 10), Text(text)],
    ),
  );
}
