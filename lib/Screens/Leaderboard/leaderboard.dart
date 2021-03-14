import 'package:flutter/material.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/constants.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardPurple,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Leaderboard",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    // textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 35,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imageUrl),
                radius: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 35,
                ),
              ),
            ],
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
                      child: ListTile(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
