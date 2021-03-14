import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Screens/Cards/BloodGlucose/bloodglucose.dart';
import 'package:health_track/Screens/Cards/BloodPressure/bp_screen.dart';
import 'package:health_track/Screens/Cards/Height/height.dart';
import 'package:health_track/Screens/Cards/Walk/walk.dart';
import 'package:health_track/Screens/Dashboard/components/appbar.dart';
import 'package:health_track/Screens/Dashboard/components/categorycard.dart';
import 'package:health_track/Screens/Dashboard/components/flexible_appbar.dart';
import 'package:health_track/constants.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'components/pedogauge.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  double _steps = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverStack(
              // insetOnOverlap: true,
              children: [
                SliverAppBar(
                  backgroundColor: kDashboardPurple,
                  automaticallyImplyLeading: false,
                  title: MyAppBar(),
                  forceElevated: true,
                  elevation: 10,
                  collapsedHeight: 140,
                  // pinned: true,
                  floating: true,
                  // s nap: true,
                  expandedHeight: 190.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FlexibleAppBar(),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 140, right: 25, left: 25),
                  sliver: SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      CategoryCard(
                        type: "Walk",
                        child: PedoGauge(),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "120/90",
                              style: TextStyle(fontSize: 23, color: Colors.red),
                            ),
                            Text(
                              "mmHg",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/water.png",
                              height: 55,
                            ),
                            Text(
                              '3 glasses',
                              style: TextStyle(fontSize: 17),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      primary: Colors.green),
                                  child: FaIcon(FontAwesomeIcons.plus),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      primary: Colors.red),
                                  child: FaIcon(FontAwesomeIcons.minus),
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            FaIcon(FontAwesomeIcons.child,
                                color: Colors.blue, size: 35),
                            Text(
                              " 5 feet \n 8 inch ",
                              style: TextStyle(
                                fontSize: 23,
                              ),
                            )
                          ],
                        ),
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Height()));
                        },
                        img: "assets/images/height.png",
                      ),
                      CategoryCard(
                        type: "Blood\nGlucose",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "120/90",
                              style: TextStyle(fontSize: 23, color: Colors.red),
                            ),
                            Text(
                              "mg/dL",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BloodGlucose()));
                        },
                        img: "assets/images/glucometer1.png",
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(1, 250.0),
                      StaggeredTile.extent(1, 170.0),
                      StaggeredTile.extent(1, 250.0),
                      StaggeredTile.extent(1, 250.0),
                      StaggeredTile.extent(1, 250.0),
                      StaggeredTile.extent(1, 170.0),
                    ],
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
