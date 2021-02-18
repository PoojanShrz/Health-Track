import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_track/Screens/Login/login_screen.dart';
import 'package:health_track/Screens/Signup/components/background.dart';
import 'package:health_track/Screens/Signup/components/or_divider.dart';
import 'package:health_track/Screens/Signup/components/social_icon.dart';
import 'package:health_track/components/already_have_an_account_check.dart';
import 'package:health_track/components/rounded%20button.dart';
import 'package:health_track/components/rounded_input_field.dart';
import 'package:health_track/components/rounded_password_field.dart';
import 'package:health_track/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  var name, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/Signup.svg",
              height: size.height * 0.27,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                AuthService().addUser(name, password).then((value) {
                  if (value.data['success']) {
                    Fluttertoast.showToast(
                        msg: value.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                });
              },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
