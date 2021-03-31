import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/Screens/Dashboard/dashboard.dart';
import 'package:health_track/Screens/Login/login.dart';
import 'package:health_track/Screens/Login/login_screen.dart';
import 'package:health_track/Screens/Signup/components/background.dart';
import 'package:health_track/Screens/Signup/components/or_divider.dart';
import 'package:health_track/Screens/Signup/components/social_icon.dart';
import 'package:health_track/components/already_have_an_account_check.dart';
import 'package:health_track/components/rounded%20button.dart';
import 'package:health_track/components/text_field_container.dart';
import 'package:health_track/constants.dart';
import 'package:health_track/services/NetworkHandler.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _globalkey = GlobalKey<FormState>();
  var email, password;
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

  //password visibility
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _globalkey,
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
              usernameTextField(),
              emailTextField(),
              passwordTextField(),
              circular
                  ? CircularProgressIndicator()
                  : RoundedButton(
                      text: "SIGN UP",
                      press: () async {
                        setState(() {
                          circular = true;
                        });
                        await checkUser();
                        if (_globalkey.currentState.validate() && validate) {
                          Map<String, String> data = {
                            "username": _usernameController.text,
                            "email": _emailController.text,
                            "password": _passwordController.text,
                          };
                          print(data);
                          var responseRegister =
                              await networkHandler.post("/user/register", data);

                          //Login Logic added here
                          if (responseRegister.statusCode == 200 ||
                              responseRegister.statusCode == 201) {
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
                                validate = true;
                                circular = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardScreen(),
                                  ),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Network Error")));
                            }
                          }

                          setState(() {
                            circular = false;
                          });
                        } else {
                          setState(() {
                            circular = false;
                          });
                        }

                        // AuthService().addUser(email, password).then((value) {
                        //   if (value.data['success']) {
                        //     Fluttertoast.showToast(
                        //         msg: value.data['msg'],
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.BOTTOM,
                        //         backgroundColor: Colors.green,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => LoginScreen(),
                        //       ),
                        //     );
                        //   }
                        // });
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
      ),
    );
  }

  checkUser() async {
    if (_usernameController.text.length == 0) {
      setState(() {
        // circular = false;
        validate = false;
        errorText = "Username cannot be empty";
      });
    } else {
      var response = await networkHandler.get(
          "https://serene-citadel-05489.herokuapp.com/user/checkUsername/${_usernameController.text}");
      if (response['Status']) {
        setState(() {
          // circular = false;
          validate = false;
          errorText = "Username already taken";
        });
      } else {
        setState(() {
          // circular = false;
          validate = true;
        });
      }
    }
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

  Widget emailTextField() {
    return TextFieldContainer(
        child: TextFormField(
      controller: _emailController,
      validator: (email) {
        if (email.isEmpty) return "Email can't be empty";
        if (!email.contains("@")) return "Email is Invalid";
        return null;
      },
      decoration: InputDecoration(
        icon: FaIcon(
          FontAwesomeIcons.solidEnvelope,
          color: kPrimaryColor,
        ),
        hintText: "Email",
        border: InputBorder.none,
      ),
    ));
  }

  Widget passwordTextField() {
    return TextFieldContainer(
        child: TextFormField(
      controller: _passwordController,
      validator: (value) {
        if (value.isEmpty) return "Password can't be empty";
        if (value.length < 6) return "Password length must have > = 6";
        return null;
      },
      obscureText: this._isHidden,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: IconButton(
          icon:
              !_isHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          onPressed: _toggleVisibility,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
