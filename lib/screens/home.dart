import 'package:eduthon/screens/chat.dart';
import 'package:eduthon/screens/team.dart';
import 'package:eduthon/shared/app_bar.dart';
import 'package:eduthon/screens/todo.dart';
import 'package:eduthon/screens/profile.dart';
import 'package:eduthon/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _updateWidget(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> widgetList = [
    TeamWidget(),
    Container(),
    ToDo(),
    Container(),
    ProfileApp(),
    Container()
  ];

  List<String> titleList = ['Team', 'Chat', 'Tasks', 'Watch', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(titleList[_currentIndex]),
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: widgetList[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => _updateWidget(index),
            selectedItemColor: mainColor,
            unselectedItemColor: iconColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.users), title: Text("Team")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.comments), title: Text("Chat")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.tasks), title: Text("Tasks")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.youtube), title: Text("Watch")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user), title: Text("Profile")),
            ]));
  }
}
