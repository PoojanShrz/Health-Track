import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Model/profileModel.dart';
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
  bool circular = true;
  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel();
  Widget page = CircularProgressIndicator();
  Image _imagefile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkProfile();
    fetchData();
  }

  void checkProfile() async {
    var response = await networkHandler.get("/profile/checkProfile");
    if (response["status"] == true) {
      setState(() {
        page = ProfileBody();
      });
    } else {
      setState(() {
        page = button();
      });
    }
  }

  void fetchData() async {
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
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
                        child: IconButton(
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
                        ),
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
                    backgroundImage: _imagefile == null
                        ? AssetImage("assets/images/user.png")
                        : NetworkHandler().getImage(profileModel.username),
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
              child: circular
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      primary: false,
                      padding: EdgeInsets.only(left: 25, right: 20),
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                profileModel.username,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                            DashedDivider(
                              text: 'User Information',
                              color: Colors.grey[700],
                              fontsize: 15,
                            ),
                            OutlinedBox(
                              text: "Name : " + profileModel.name,
                              color: Colors.black,
                              fontsize: 17,
                              press: () {},
                            ),
                            OutlinedBox(
                              text: "Date of Birth : " + profileModel.DOB,
                              color: Colors.black,
                              fontsize: 17,
                              press: () {},
                            ),
                            OutlinedBox(
                              text: "Gender : " + profileModel.gender,
                              color: Colors.black,
                              fontsize: 17,
                              press: () {},
                            ),
                            OutlinedBox(
                              text: "Weight : " + profileModel.weight,
                              color: Colors.black,
                              fontsize: 17,
                              press: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 80),
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

  Widget button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tap to button to add profile data",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfile()))
            },
            child: Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Add Proile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
