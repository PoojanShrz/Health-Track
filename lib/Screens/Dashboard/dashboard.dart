import 'package:flutter/material.dart';
import 'package:health_track/Screens/Dashboard/dash_body.dart';
// import 'package:health_track/Screens/Dashboard/dashboard_body.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dash(),
    );
  }
}
