import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/Screens/Login/login_body.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/components/dashed_divider.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDashboardPurple,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
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
                  Text(
                    'My Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Image.asset(
                        "assets/images/trophy.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 70,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.69,
              width: MediaQuery.of(context).size.width,
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
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          name,
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: OutlinedBox(
                          text: email,
                          color: Colors.black,
                          fontsize: 20,
                          press: () {},
                        ),
                      ),
                      DashedDivider(
                        text: 'User Information',
                        color: Colors.grey[700],
                        fontsize: 17,
                      ),
                      OutlinedBox(
                        text: "Gender",
                        color: Colors.black,
                        fontsize: 20,
                        press: () {},
                      ),
                      OutlinedBox(
                        text: "Date of Birth",
                        color: Colors.black,
                        fontsize: 20,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 130),
                  Divider(
                    color: Colors.grey[400],
                    height: 5,
                    thickness: 2,
                  ),
                  FNButton(
                    txt: 'Update Profile',
                    fontsize: 17,
                    color: kDashboardPurple,
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                  FNButton(
                    txt: 'Log out',
                    fontsize: 17,
                    color: kDashboardPurple,
                    press: () {
                      signOutGoogle();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginBody();
                          },
                        ),
                      );
                      Fluttertoast.showToast(
                          msg: 'Logged Out',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> signOutGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }
}
