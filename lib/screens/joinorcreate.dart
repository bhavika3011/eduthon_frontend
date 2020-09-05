import 'package:eduthon/screens/home.dart';
import 'package:eduthon/theme/colors.dart';
import 'package:flutter/material.dart';

class JoinOrCreateTeam extends StatefulWidget {
  @override
  _JoinOrCreateTeamState createState() => _JoinOrCreateTeamState();
}

class _JoinOrCreateTeamState extends State<JoinOrCreateTeam> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  InkWell(
                    onTap: () {
                      print("button tapped");
                    },
                    child: Container(
                        height: 50,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [iconColor, mainColor],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Icon(Icons.add,
                                    size: 30, color: iconColor)),
                            Expanded(
                              flex: 6,
                              child: Text("Create a team",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [iconColor, mainColor],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                          ),
                          height: 2.0,
                          width: 130.0,
                        ),
                      ),
                      Text("OR", style: TextStyle(fontStyle: FontStyle.italic)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [mainColor, iconColor],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                          ),
                          height: 2.0,
                          width: 130.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Container(
                      child: Column(
                    children: [
                      Text("Join an existing one!",
                          style: TextStyle(color: mainColor, fontSize: 20)),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(18.0),
                        child: SizedBox(
                          width: 280,
                          height: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller,
                            validator: (value) {
                              if (value.isEmpty) return "Please enter a code";
                              return null;
                            },
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.purple[300])),
                                hintText: "Paste your code here",
                                hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                          onTap: () {
                            print("button tapped");
                          },
                          child: Container(
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [iconColor, mainColor],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => HomeScreen()));
                                },
                                child: Center(
                                  child: Text(
                                    "Join team",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )))
                    ],
                  )),
                ]),
          ),
        ),
      ),
    );
  }
}
