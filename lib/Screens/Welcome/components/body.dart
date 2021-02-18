import 'package:flutter/material.dart';
import 'package:health_track/Screens/Login/login_screen.dart';
import 'package:health_track/Screens/Signup/signup_screen.dart';
import 'package:health_track/Screens/Welcome/components/background.dart';
import 'package:health_track/components/rounded%20button.dart';
import 'package:health_track/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provides us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text("WELCOME \nTO \nHEALTH TRACK",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
                textAlign: TextAlign.center),
            SizedBox(
              height: size.height * 0.01,
            ),
            Image.asset(
              "assets/images/welcome_Srn2.png",
              height: size.height * 0.55,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
