import 'package:eduthon/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class TeamWidget extends StatefulWidget {
  @override
  _TeamWidgetState createState() => _TeamWidgetState();
}

class _TeamWidgetState extends State<TeamWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MemberCard(),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 5,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  crossAxisCount: 2,
                )),
          ),
        ],
      ),
    ));
  }
}

class MemberCard extends StatelessWidget {
  final String url =
      "https://avatars2.githubusercontent.com/u/47568882?s=460&u=bbc6adfd634233f8203ddd66d9007e6f1a2a951f&v=4";
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 1,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(height: 5),
          Text("username",
              style: TextStyle(
                  fontSize: 16.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: progressBar(4, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("4/10",
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
              SizedBox(width: 3),
              Icon(FontAwesomeIcons.check, size: 15, color: Colors.green)
            ],
          )
        ]));
  }

  Widget progressBar(int completed, int total) {
    List<Widget> widgetList = [];
    List<Widget> completedList = List.generate(
        completed,
        (index) => Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]),
                    color: mainColor),
                height: 10)));
    List<Widget> pendingList = List.generate(
        total - completed,
        (index) => Expanded(
              flex: 1,
              child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]))),
            ));
    widgetList = completedList + pendingList;
    return Row(
      children: widgetList,
    );
  }
}
