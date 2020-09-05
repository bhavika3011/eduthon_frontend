import 'package:flutter/material.dart';
import 'package:eduthon/theme/colors.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter-To-Do-List',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

class ToDo extends StatefulWidget {
  // List<String> _todoItems = [];

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> with SingleTickerProviderStateMixin {
  TabController tabController;
  var tabHeaderStyle = TextStyle(fontSize: 15, color: iconColor);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  TabBar _getTabBar() {
    return TabBar(
      indicatorColor: iconColor,
      tabs: <Widget>[
        Tab(child: Text("Group", style: tabHeaderStyle)),
        Tab(child: Text("Personal", style: tabHeaderStyle)),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(List<Widget> tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                // Container(height: 190, child: WavyHeaderImage()),
                SizedBox(height: 45, child: _getTabBar()),
                SizedBox(
                    height: 480,
                    child: _getTabBarView([groupTodo(), personalTodo()]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personalTodo() {
    // @override
    // Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Container(
          //   width: 400,
          //   height: 600,
          //   child: Image.asset(
          //     'assets/images/image.png',
          //     fit: BoxFit.contain,
          //   ),
          // ),
          // Positioned(
          //   child: Text(
          //     "Personal Schedules",
          //     style: TextStyle(
          //         color: iconColor, fontSize: 40, fontWeight: FontWeight.bold),
          //   ),
          //   top: 40,
          //   left: 20,
          // ),
          DraggableScrollableSheet(
            initialChildSize: 0.85,
            maxChildSize: 0.90,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task No $index",
                            style: TextStyle(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "This is the detail of task No $index",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: mainColor,
                          ),
                          isThreeLine: true,
                        );
                      },
                      controller: scrolController,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.purple[100],
                      ),
                      backgroundColor: Colors.white,
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget groupTodo() {
    // @override
    // Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Container(
          //   width: 400,
          //   height: 600,
          //   child: Image.asset(
          //     'assets/images/image.png',
          //     fit: BoxFit.contain,
          //   ),
          // ),
          // Positioned(
          //   child: Text(
          //     "Group Schedules",
          //     style: TextStyle(
          //         color: iconColor, fontSize: 40, fontWeight: FontWeight.bold),
          //   ),
          //   top: 40,
          //   left: 20,
          // ),
          DraggableScrollableSheet(
            initialChildSize: 0.85,
            maxChildSize: 0.90,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task No $index",
                            style: TextStyle(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "This is the detail of task No $index",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: mainColor,
                          ),
                          isThreeLine: true,
                        );
                      },
                      controller: scrolController,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.purple[100],
                      ),
                      backgroundColor: Colors.white,
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
