import 'package:flutter/material.dart';
import 'package:health_track/Screens/Cards/BloodGlucose/bloodglucose.dart';
import 'package:health_track/Screens/Cards/BloodPressure/bp_screen.dart';
import 'package:health_track/Screens/Cards/Height/height.dart';
import 'package:health_track/Screens/Cards/Walk/walk.dart';
import 'package:health_track/Screens/Dashboard/components/appbar.dart';
// import 'package:health_track/Screens/Dashboard/components/category.dart';
import 'package:health_track/Screens/Dashboard/components/categorycard.dart';
import 'package:health_track/Screens/Dashboard/components/flexible_appbar.dart';
import 'package:health_track/constants.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: kDashboardPurple,
                automaticallyImplyLeading: false,
                title: MyAppBar(),
                pinned: true,
                expandedHeight: 190.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FlexibleAppBar(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    CategoryCard(
                      type: "Walk",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PedometerCount(),
                          ),
                        );
                      },
                      img: "assets/images/Walk1.png",
                    ),
                    CategoryCard(
                      type: "Blood\nPressure",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BloodPressure(),
                          ),
                        );
                      },
                      img: "assets/images/blood_pressure.png",
                    ),
                    CategoryCard(
                      type: "Water",
                      press: () {},
                      img: "assets/images/water.png",
                    ),
                    CategoryCard(
                      type: "Calories",
                      press: () {},
                      img: "assets/images/calorie.png",
                    ),
                    CategoryCard(
                      type: "Height",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Height()));
                      },
                      img: "assets/images/height.png",
                    ),
                    CategoryCard(
                      type: "Blood\nGlucose",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodGlucose()));
                      },
                      img: "assets/images/glucometer1.png",
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
