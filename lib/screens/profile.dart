import 'package:flutter/material.dart';
import 'package:eduthon/theme/colors.dart';
import 'package:eduthon/main.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container(height: 275, child: WavyHeaderImage()),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [mainColor, iconColor]),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "image.png",
                          ),
                          radius: 50.0,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     // color: const Color(0xff7c94b6),
                        //     image: const DecorationImage(
                        //       image: NetworkImage(
                        //           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        //       fit: BoxFit.contain,
                        //     ),
                        //     border: Border.all(
                        //       color: Colors.black,
                        //       width: 40,
                        //     ),
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
