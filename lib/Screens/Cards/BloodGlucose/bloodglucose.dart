import 'package:flutter/material.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/constants.dart';

class BloodGlucose extends StatefulWidget {
  @override
  _BloodGlucoseState createState() => _BloodGlucoseState();
}

class _BloodGlucoseState extends State<BloodGlucose> {
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
                  'Blood Glucose',
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
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 20),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 270.0,
                    child: ListView(
                      children: [],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 5,
                  thickness: 2,
                ),
                FNButton(
                  txt: 'Record Manually',
                  fontsize: 17,
                  color: kDashboardPurple,
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
