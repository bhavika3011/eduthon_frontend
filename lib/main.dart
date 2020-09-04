import 'package:eduthon/screens/joinorcreate.dart';
import 'package:eduthon/shared/fade_animation.dart';
import 'package:eduthon/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var tabHeaderStyle = TextStyle(fontSize: 15, color: mainColor);
  TextEditingController emailController,
      usernameController,
      passwordController,
      usernameLoginController,
      passwordLoginController;
  FocusNode emailNode,
      usernameNode,
      passwordNode,
      usernameLoginNode,
      passwordLoginNode;
  final _formKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    emailNode = FocusNode();
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    usernameLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    usernameLoginNode = FocusNode();
    passwordLoginNode = FocusNode();
  }

  TabBar _getTabBar() {
    return TabBar(
      indicatorColor: iconColor,
      tabs: <Widget>[
        Tab(child: Text("Register", style: tabHeaderStyle)),
        Tab(child: Text("Login", style: tabHeaderStyle)),
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
                Container(height: 190, child: WavyHeaderImage()),
                SizedBox(height: 45, child: _getTabBar()),
                SizedBox(
                    height: 480,
                    child: _getTabBarView([registerWidget(), loginWidget()]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          FadeAnimation(
              0.4,
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[100]))),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return "Please enter your email";
                            if (!isEmail(value))
                              return "Please enter a valid email";

                            return null;
                          },
                          textInputAction: TextInputAction.go,
                          controller: emailController,
                          focusNode: emailNode,
                          onFieldSubmitted: (value) {
                            usernameNode.requestFocus();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email ID",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: usernameController,
                          focusNode: usernameNode,
                          onFieldSubmitted: (value) {
                            passwordNode.requestFocus();
                          },
                          validator: (value) {
                            if (value.isEmpty)
                              return "Please enter your username";
                            return null;
                          },
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return "Please enter your password";
                            if (value.length < 8)
                              return "Please enter min 8 characters";
                            return null;
                          },
                          controller: passwordController,
                          focusNode: passwordNode,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            0.6,
            InkWell(
              onTap: () {
                print(passwordController.value.text);
                if (_formKey.currentState.validate())
                  //TODO: register API

                  print("register api");
                else
                  print("do nothing");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JoinOrCreateTeam()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    iconColor,
                    Colors.purple[200],
                    mainColor,
                    // Colors.purple[400]
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget loginWidget() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          FadeAnimation(
              0.4,
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[100]))),
                        child: TextFormField(
                          controller: usernameLoginController,
                          focusNode: usernameLoginNode,
                          validator: (value) {
                            if (value.isEmpty) return "Please enter a username";
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordLoginController,
                          focusNode: passwordLoginNode,
                          validator: (value) {
                            if (value.isEmpty) return "Please enter a password";
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            0.6,
            Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  iconColor,
                  Colors.purple[200],
                  mainColor,
                  // Colors.purple[400]
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // FadeAnimation(
          //     0.8,
          //     Text(
          //       "Forgot Password?",
          //       style: TextStyle(color: mainColor),
          //     )),
        ],
      ),
    );
  }
}

class WavyHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [iconColor, mainColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
