import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:eduthon/theme/colors.dart';

class ToDo extends StatefulWidget {
  // List<String> _todoItems = [];

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> with SingleTickerProviderStateMixin {
  TabController tabController;
  var tabHeaderStyle = TextStyle(fontSize: 15, color: mainColor);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  TabBar _getTabBar() {
    return TabBar(
      indicatorColor: iconColor,
      indicatorWeight: 6,
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 55, child: _getTabBar()),
                SizedBox(
                    height: 525,
                    child: _getTabBarView([groupTodo(), personalTodo()]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personalTodo() {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     width: 300,
          //     height: 600,
          //     decoration:
          //         BoxDecoration(borderRadius: BorderRadius.circular(20)),
          //     child: Image.asset(
          //       'assets/images/alone.jpg',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Positioned(
            child: Text(
              "Set your personal tasks here!",
              style: TextStyle(
                  color: iconColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            top: 10,
            left: 20,
          ),
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
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Task No $index",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "This is the detail of task No $index",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              leading: Checkbox(
                                  value: true,
                                  onChanged: (val) {},
                                  activeColor: Colors.green),
                              isThreeLine: true,
                            ),
                            Divider(color: iconColor, height: 2)
                          ],
                        );
                      },
                      controller: scrolController,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    child: addPersonalTask(),
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

  Widget addPersonalTask() {
    return InkWell(
      onTap: () {
        print("hey");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text("Set new task!",
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    print("api call");
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Done",
                        style: TextStyle(fontSize: 17, color: mainColor)),
                  ))
            ],
            content: Container(
              height: 250,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      // textAlign: TextAlign.center,
                      // controller: controller,
                      validator: (value) {
                        if (value.isEmpty) return "Please enter a title";
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300])),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.purple[300])),
                          hintText: "Task title",
                          hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.normal,
                              fontSize: 18)),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300])),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.purple[300])),
                          hintText: "Add a description (optional)",
                          hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.normal,
                              fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 5.0),
        child: Card(
          elevation: 3,
          child: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.purple[200],
            ),
          ),
        ),
      ),
    );
  }

  Widget groupTodo() {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Container(
          //   width: 400,
          //   height: 600,
          //   child: Image.asset(
          //     'assets/images/group.jpg',
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Positioned(
            child: Text(
              "View your common tasks here!",
              style: TextStyle(
                  color: iconColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            top: 10,
            left: 20,
          ),
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
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "This is the detail of task No $index",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            leading: Checkbox(
                                value: true,
                                onChanged: (val) {},
                                activeColor: Colors.green));
                      },
                      controller: scrolController,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    child: Container(),
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
