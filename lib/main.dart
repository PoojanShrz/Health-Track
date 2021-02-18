import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_track/Screens/Welcome/welcome_screen.dart';
import 'package:health_track/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  runApp(HealthTrack());
}

class HealthTrack extends StatefulWidget {
  @override
  _HealthTrackState createState() => _HealthTrackState();
}

class _HealthTrackState extends State<HealthTrack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Track',
      theme: ThemeData(
        fontFamily: "Gilroy",
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
