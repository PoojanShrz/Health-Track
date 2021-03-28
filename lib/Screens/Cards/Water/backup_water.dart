import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';
import 'package:intl/intl.dart';

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  DateTime now = new DateTime.now();
  static int n = 0;

  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    setState(() {
      if (n != 0) n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDashboardBlue,
        title: Text("Water"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedBox(
            text: DateFormat.yMMMMEEEEd().format(now),
            color: Colors.black,
            fontsize: 15,
            press: () {},
          ),
          Text(
            '$n',
            style: TextStyle(fontSize: 70),
          ),
          Text(
            "cups",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo,
            ),
            child: Image.asset(
              "assets/images/water2.png",
              height: 250,
              width: 200,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: CircleBorder(),
                    primary: Colors.red),
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  size: 30,
                ),
                onPressed: minus,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: CircleBorder(),
                  primary: Colors.green,
                ),
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 30,
                ),
                onPressed: add,
              ),
            ],
          )
        ],
      ),
    );
  }
}
