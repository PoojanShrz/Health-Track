import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Screens/Dashboard/dashboard.dart';
import 'package:health_track/Screens/Login/components/background.dart';
import 'package:health_track/Screens/Signup/components/or_divider.dart';
import 'package:health_track/Screens/Signup/components/social_icon.dart';
import 'package:health_track/Screens/Signup/signup_screen.dart';
import 'package:health_track/components/already_have_an_account_check.dart';
import 'package:health_track/components/rounded%20button.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_track/components/text_field_container.dart';
import 'package:health_track/constants.dart';
import 'package:health_track/services/NetworkHandler.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool vis = true;
  String _email, _password;
  final auth = FirebaseAuth.instance;
  var email, password, token;

  final _globalkey = GlobalKey<FormState>();

  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

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
              usernameTextField(),
              passwordTextField(),
              circular
                  ? CircularProgressIndicator()
                  : RoundedButton(
                      text: "LOGIN",
                      press: () async {
                        setState(() {
                          circular = true;
                        });
                        Map<String, String> data = {
                          "username": _usernameController.text,
                          "password": _passwordController.text,
                        };
                        var response =
                            await networkHandler.post("/user/login", data);

                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          Map<String, dynamic> output =
                              json.decode(response.body);
                          print(output["token"]);
                          await storage.write(
                              key: "token", value: output["token"]);
                          setState(() {
                            circular = false;
                            validate = true;
                          });
                          Fluttertoast.showToast(
                              msg: 'Logged in Successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                              (route) => false);
                        } else {
                          String output = json.decode(response.body);
                          setState(() {
                            circular = false;
                            validate = false;
                            errorText = "Username or Password is Incorrect";
                            // errorText = output;
                          });
                        }
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

  Widget usernameTextField() {
    return TextFieldContainer(
        child: TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        errorText: validate ? null : errorText,
        icon: FaIcon(
          FontAwesomeIcons.solidUserCircle,
          color: kPrimaryColor,
        ),
        hintText: "Username",
        border: InputBorder.none,
      ),
    ));
  }

  Widget passwordTextField() {
    return TextFieldContainer(
        child: TextFormField(
      controller: _passwordController,
      obscureText: vis,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        errorText: validate ? null : errorText,
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              vis = !vis;
            });
          },
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
