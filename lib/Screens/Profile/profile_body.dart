import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/Screens/Login/login_body.dart';
import 'package:health_track/Screens/Profile/profile_screen.dart';
import 'package:health_track/Screens/Profile/updateprofile.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/components/dashed_divider.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';
import 'package:health_track/services/NetworkHandler.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  NetworkHandler networkHandler = NetworkHandler();
  Widget page = CircularProgressIndicator();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    var response = await networkHandler
        .get("https://serene-citadel-05489.herokuapp.com/profile/checkProfile");
    if (response["status"] == true) {
      setState(() {
        page = showProfile();
      });
    } else {
      setState(() {
        page = updateButton();
      });
    }
  }

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
                        child: updateButton(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkHandler().getImage("PoozShrz"),
                    radius: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Username",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: OutlinedBox(
                          text: "poozshrz@gmail.com",
                          color: Colors.black,
                          fontsize: 17,
                          press: () {},
                        ),
                      ),
                      DashedDivider(
                        text: 'User Information',
                        color: Colors.grey[700],
                        fontsize: 15,
                      ),
                      OutlinedBox(
                        text: "Gender",
                        color: Colors.black,
                        fontsize: 17,
                        press: () {},
                      ),
                      OutlinedBox(
                        text: "Date of Birth",
                        color: Colors.black,
                        fontsize: 17,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  Divider(
                    color: Colors.grey[400],
                    height: 5,
                    thickness: 2,
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

  Widget updateButton() {
    return IconButton(
      icon: FaIcon(FontAwesomeIcons.userEdit),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfile(),
          ),
        );
      },
      color: Colors.white,
    );
  }

  Future<void> signOutGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  Widget showProfile() {
    return Center(child: Text("Profile Data is avaliable"));
  }
}
