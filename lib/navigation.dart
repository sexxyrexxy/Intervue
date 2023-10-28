import 'package:flutter/material.dart';
import 'models/colors.dart';
import 'screens/admin_analytics_screen.dart';
import 'screens/admin_candidates_screen.dart';
import 'screens/admin_main_screen.dart';
import 'screens/admin_messages_screen.dart';
import 'screens/admin_set_questions_screen.dart';
import 'screens/admin_settings_screen.dart';
import 'screens/speech_to_text.dart';

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

  static int currentIndex = 0;
  bool _isLoading = true;

  List<Widget> screens = [
    AdminMainScreen(),
    AdminSetInterviewScreen(),
    AdminCandidatesScreen(),
    AdminAnalyticsScreen(),
    AdminMessageScreen(),
    AdminSettingsScreen(),
    SpeechToText()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: 200,
          height: double.infinity,
          color: secondaryDarkBlue,
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children: [
              Image.asset('lib/assets/images/Intervue-Logo.png'),
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
                child: navItem(Icons.question_answer, 'Interview',
                    currentIndex == 1 ? true : false),
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: navItem(Icons.people, 'Candidates',
                      currentIndex == 2 ? true : false)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: navItem(Icons.line_axis_outlined, 'Analytics',
                      currentIndex == 3 ? true : false)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                child: navItem(Icons.notifications, 'Messages',
                    currentIndex == 4 ? true : false),
              ),
              Divider(
                color: black,
                thickness: 1.5,
              ),
              Spacer(),
               GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 5;
                  });
                },
                child: navItem(Icons.settings, 'Settings',
                    currentIndex == 5 ? true : false),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 6;
                  });
                },
                child: navItem(Icons.build, 'STT',
                    currentIndex == 6 ? true : false),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 5;
                  });
                },
                child: navItem(
                    Icons.logout, 'Log Out', currentIndex == 5 ? true : false),
              ),
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: screens[currentIndex]))
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
          color: backgroundWhite,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 17, color: backgroundWhite),
        )
      ],
    ),
  );
}
