import 'package:eduthon/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
