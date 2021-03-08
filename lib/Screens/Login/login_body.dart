import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_track/Screens/Dashboard/dashboard.dart';
import 'package:health_track/Screens/Login/components/background.dart';
import 'package:health_track/Screens/Signup/components/or_divider.dart';
import 'package:health_track/Screens/Signup/components/social_icon.dart';
import 'package:health_track/Screens/Signup/signup_screen.dart';
import 'package:health_track/components/already_have_an_account_check.dart';
import 'package:health_track/components/rounded%20button.dart';
import 'package:health_track/components/rounded_input_field.dart';
import 'package:health_track/components/rounded_password_field.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  var email, password, token;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: size.height * 0.01),
              SvgPicture.asset(
                "assets/icons/LoginScreen.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.01),
              RoundedInputField(
                hintText: "Email",
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              RoundedPasswordField(
                hintText: "Password",
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  // AuthService().login(email, password).then((value) {
                  //   if (value.data['success']) {
                  //     token = value.data['token'];
                  //     Fluttertoast.showToast(
                  //         msg: 'Logged in Successfully',
                  //         toastLength: Toast.LENGTH_SHORT,
                  //         gravity: ToastGravity.BOTTOM,
                  //         backgroundColor: Colors.green,
                  //         textColor: Colors.white,
                  //         fontSize: 16.0);
                  //     //Navigates to the Dashboard Screen after valid authentication
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => DashboardScreen(),
                  //       ),
                  //     );
                  //   }
                  // });
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SocialIcon(
                  //   iconSrc: "assets/icons/facebook.svg",
                  //   press: () {},
                  // ),
                  // SocialIcon(
                  //   iconSrc: "assets/icons/twitter.svg",
                  //   press: () {},
                  // ),
                  SocialIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {
                        signInWithGoogle().whenComplete(() {
                          Fluttertoast.showToast(
                              msg: 'Logged in Successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DashboardScreen();
                              },
                            ),
                          );
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
