import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_track/Screens/Profile/profile_body.dart';
import 'package:health_track/Screens/Profile/profile_screen.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/constants.dart';
import 'package:health_track/services/NetworkHandler.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final networkHandler = NetworkHandler();

  PickedFile _imageFile;

  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _weight = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        backgroundColor: kDashboardPurple,
      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            imageProfile(),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
              child: Text(
                "Personal Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            nameTextField(),
            SizedBox(height: 20),
            dobField(),
            SizedBox(height: 20),
            gender(),
            SizedBox(height: 20),
            weight(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FNButton(
                    color: Colors.green,
                    txt: "Save",
                    press: () async {
                      setState(() {
                        circular = true;
                      });
                      if (_globalkey.currentState.validate()) {
                        Map<String, String> data = {
                          "name": _name.text,
                          "dob": _dob.text,
                          "gender": _gender.text,
                          "weight": _weight.text,
                        };
                        var response = await networkHandler.post(
                            "https://serene-citadel-05489.herokuapp.com/profile/add",
                            data);
                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          if (_imageFile != null) {
                            var imageResponse = await networkHandler.patchImage(
                                "https://serene-citadel-05489.herokuapp.com/profile/add/image",
                                _imageFile.path);
                            if (imageResponse.statusCode == 200) {
                              setState(() {
                                circular = false;
                              });
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()),
                                  (route) => false);
                            }
                          } else {
                            setState(() {
                              circular = false;
                            });
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                                (route) => false);
                          }
                        }
                      }
                    },
                    txtColor: Colors.white,
                    fontsize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                Expanded(
                  child: FNButton(
                    color: Colors.red,
                    txt: "Cancel",
                    press: () {
                      Navigator.of(context).pop();
                    },
                    txtColor: Colors.white,
                    fontsize: 18,
                  ),
                ),
              ],
            ),
            circular ? LinearProgressIndicator() : Center()
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(fit: StackFit.loose, children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/images/user.png")
              : FileImage(File(_imageFile.path)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 110.0, right: 100.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 25.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose your Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.image,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "Name can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kDashboardPurple,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: kDashboardPurple,
        ),
        labelText: "Name",
        hintText: "Barney Stinson",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      controller: _dob,
      validator: (value) {
        if (value.isEmpty) return "DOB can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kDashboardPurple,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.date_range,
          color: kDashboardPurple,
        ),
        labelText: "Date of Birth",
        hintText: "dd/mm/yyyy",
      ),
    );
  }

  Widget gender() {
    return TextFormField(
      controller: _gender,
      validator: (value) {
        if (value.isEmpty) return "Gender can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kDashboardPurple,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.assignment_ind_outlined,
          color: kDashboardPurple,
        ),
        labelText: "Gender",
        // helperText: "Male or Female",
        hintText: "Male",
      ),
    );
  }

  Widget weight() {
    return TextFormField(
      controller: _weight,
      validator: (value) {
        if (value.isEmpty) return "Weight can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kDashboardPurple,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.fitness_center,
          color: kDashboardPurple,
        ),
        labelText: "Weight",
        // helperText: "Male or Female",
        hintText: "65",
      ),
    );
  }
}
