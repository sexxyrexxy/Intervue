import 'package:flutter/material.dart';
import 'models/colors.dart';
import 'screens/admin_analytics_screen.dart';
import 'screens/admin_candidates_screen.dart';
import 'screens/admin_main_screen.dart';
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
          color: secondaryDarkBlue,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: navItem(Icons.home_rounded, 'Dashboard',
                      currentIndex == 0 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: navItem(Icons.people, 'Candidates',
                      currentIndex == 1 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: navItem(Icons.line_axis_outlined, 'Analytics',
                      currentIndex == 2 ? true : false)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: navItem(Icons.message_rounded, 'Messages',
                    currentIndex == 3 ? true : false),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                child: navItem(
                    Icons.settings, 'Settings', currentIndex == 4 ? true : false),
              ),
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          child: screens[currentIndex]))
      ]),
    );
  }
}

Container navItem(IconData icon, String text, bool active) {
  return Container(
    margin: EdgeInsets.only(bottom: 50),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: active ? primaryBlue : Colors.transparent,
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: backgrounWhite,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 17, color: backgrounWhite),
        )
      ],
    ),
  );
}
