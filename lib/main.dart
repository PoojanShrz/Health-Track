import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_track/Screens/Dashboard/dashboard.dart';
import 'package:health_track/Screens/Welcome/welcome_screen.dart';
import 'package:health_track/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await Hive.openBox<int>('steps');
  runApp(HealthTrack());
}

class HealthTrack extends StatefulWidget {
  @override
  _HealthTrackState createState() => _HealthTrackState();
}

class _HealthTrackState extends State<HealthTrack> {
  Widget page = WelcomeScreen();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = DashboardScreen();
      });
    } else {
      setState(() {
        page = WelcomeScreen();
      });
    }
  }

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
      home: page,
    );
  }
}
