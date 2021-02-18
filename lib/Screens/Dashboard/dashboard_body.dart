import 'package:flutter/material.dart';
import 'package:health_track/Screens/Dashboard/components/categorycard.dart';
import 'package:health_track/constants.dart';

class DashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //Height of the container
            height: size.height * 0.35,
            decoration: BoxDecoration(
              color: kDashboardPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: kDashboardBlue,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/user.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "November 4, 2020",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Good Day, Pooz!",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          type: "Walk",
                          img: "assets/images/Walk.png",
                        ),
                        CategoryCard(
                          type: "Blood Pressure",
                          img: "assets/images/Walk.png",
                        ),
                        CategoryCard(
                          type: "Water",
                          img: "assets/images/Walk.png",
                        ),
                        CategoryCard(
                          type: "Calories",
                          img: "assets/images/Walk.png",
                        ),
                        CategoryCard(
                          type: "Height",
                          img: "assets/images/Walk.png",
                        ),
                        CategoryCard(
                          type: "Blood Glucose",
                          img: "assets/images/Walk.png",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
