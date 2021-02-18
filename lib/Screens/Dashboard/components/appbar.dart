import 'package:flutter/material.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/Screens/Profile/profile_screen.dart';
import 'package:health_track/constants.dart';

class MyAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const MyAppBar();

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 23,
                  ),
                )
                //  Image.asset(
                //   "assets/images/user.png",
                //   height: 40,
                //   width: 40,
                // ),
                ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'My Dashboard',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/trophy.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
