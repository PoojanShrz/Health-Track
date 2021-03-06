import 'package:flutter/material.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/constants.dart';
import 'package:intl/intl.dart';

class FlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const FlexibleAppBar();

  @override
  Widget build(BuildContext context) {
    //Display Date and Time
    DateTime now = new DateTime.now();
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        color: kDashboardPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: new Text(
                  DateFormat.yMMMMEEEEd().format(now),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Good Day, " + name + "!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
