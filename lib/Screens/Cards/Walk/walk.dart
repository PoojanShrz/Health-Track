import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:health_track/constants.dart';
import 'package:pedometer/pedometer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class PedometerCount extends StatefulWidget {
  @override
  _PedometerCountState createState() => _PedometerCountState();
}

class _PedometerCountState extends State<PedometerCount> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '!rest!';
  double _steps = 0.0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available' as double;
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  void onVolumeChanged(double value) {
    setState(() {
      _steps = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 10.0,
        backgroundColor: kDashboardPurple,
        automaticallyImplyLeading: false,
        leading: Center(
          child: FaIcon(
            FontAwesomeIcons.walking,
            color: Colors.green,
          ),
        ),
        title: Text(
          'Pedometer',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SfRadialGauge(
                title: GaugeTitle(
                  text: "Pedometer",
                  textStyle: TextStyle(color: kDashboardPurple, fontSize: 40),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 10000,
                      radiusFactor: 0.8,
                      startAngle: 270,
                      endAngle: 270,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        cornerStyle: CornerStyle.bothCurve,
                        thickness: 15,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: _steps,
                            width: 15,
                            onValueChanged: onVolumeChanged,
                            enableAnimation: true,
                            animationDuration: 3000,
                            enableDragging: true,
                            cornerStyle: CornerStyle.bothCurve,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            gradient: const SweepGradient(colors: <Color>[
                              Color(0xFFCC2B5E),
                              Color(0xFF753A88)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                          value: _steps,
                          onValueChanged: onVolumeChanged,
                          enableAnimation: true,
                          enableDragging: true,
                          animationDuration: 3000,
                          markerHeight: 34,
                          markerWidth: 34,
                          markerType: MarkerType.circle,
                          borderWidth: 2,
                          color: Color(0xFF753A88),
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          axisValue: 0.2,
                          positionFactor: 0.1,
                          widget: Text(
                            _steps.toInt().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCC2B5E),
                            ),
                          ),
                        ),
                        GaugeAnnotation(
                            angle: 95,
                            positionFactor: 0.4,
                            widget: Text('/10000' + '' + '\nSteps',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFCC2B5E)))),
                      ])
                ]),
            Text(
              'Pedestrian status:',
              style: TextStyle(fontSize: 30),
            ),
            FaIcon(
                _status == 'walking'
                    ? FontAwesomeIcons.walking
                    : _status == 'stopped'
                        ? FontAwesomeIcons.male
                        : FontAwesomeIcons.bed,
                size: 70,
                color: Colors.green),
            Center(
              child: Text(
                _status,
                style: _status == 'walking' || _status == 'stopped'
                    ? TextStyle(fontSize: 30)
                    : TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
