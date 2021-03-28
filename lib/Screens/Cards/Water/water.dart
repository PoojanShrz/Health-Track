import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';
import 'package:intl/intl.dart';

class BWater extends StatefulWidget {
  @override
  _BWaterState createState() => _BWaterState();
}

class _BWaterState extends State<BWater> {
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
      backgroundColor: kDashboardPurple,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Water',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height - 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

            // ListView(
            //   primary: false,
            //   padding: EdgeInsets.only(left: 25, right: 20),
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 45),
            //       child: Container(
            //         height: MediaQuery.of(context).size.height - 270.0,
            //         child: ListView(
            //           children: [],
            //         ),
            //       ),
            //     ),
            //    ],
            // ),
          ),
        ],
      ),
    );
  }
}
