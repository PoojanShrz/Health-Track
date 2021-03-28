import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/components/Slidable%20Widget/data.dart';
import 'package:health_track/components/Slidable%20Widget/slide_model.dart';
import 'package:health_track/components/list_widget.dart';
import 'package:health_track/constants.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final List<Data> data = DataList.getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardPurple,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.userPlus),
                  color: Colors.white,
                  padding: EdgeInsets.only(right: 10.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: StackItem(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: StackItem(
                  large: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: StackItem(),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height - 270.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(
                left: 25,
                right: 20,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView.builder(
                      itemBuilder: (context, index) => ProfileItem(
                        index: index + 1,
                      ),
                      shrinkWrap: true,
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StackItem extends StatelessWidget {
  final bool large;

  const StackItem({Key key, this.large = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: large ? 90 : 70.0,
          height: large ? 90 : 70.0,
          child: Stack(
            children: [
              ClipPolygon(
                sides: 6,
                borderRadius: 8.0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(3.0),
                  child: ClipPolygon(
                    borderRadius: 8.0,
                    sides: 6,
                    child: CircleAvatar(
                      child: Image.asset("assets/images/user.png"),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.9, -0.9),
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "Poozan Shrz",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        Text(
          "252",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white54,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final int index;

  const ProfileItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "$index",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/user.png"),
              radius: 30,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Poozan Shrz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "213",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4.0),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: index % 3 == 0
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: Colors.green,
                      ),
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.add,
                      size: 20.0,
                      color: Colors.green,
                    ))
                : Text(
                    "Following",
                    style: TextStyle(
                      color: kDashboardBlue,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
