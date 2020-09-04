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

  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => _updateWidget(index),
            selectedItemColor: mainColor,
            unselectedItemColor: iconColor,
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
