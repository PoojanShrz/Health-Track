import 'package:flutter/material.dart';
import 'package:health_track/Screens/Cards/BloodPressure/bp_body.dart';

class BloodPressure extends StatefulWidget {
  BloodPressure({Key key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BPBody(),
    );
  }
}
