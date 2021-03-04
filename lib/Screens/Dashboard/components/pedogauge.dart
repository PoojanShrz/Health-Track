import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PedoGauge extends StatefulWidget {
  const PedoGauge({
    Key key,
  }) : super(key: key);

  @override
  _PedoGaugeState createState() => _PedoGaugeState();
}

class _PedoGaugeState extends State<PedoGauge> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = 'Rest';
  double steps = 0.0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    if (mounted == true) {
      setState(() {
        steps = event.steps;
      });
    }
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    if (mounted == true) {
      setState(() {
        status = event.status;
      });
    }
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    if (mounted == true) {
      setState(() {
        status = 'Pedestrian Status not available';
      });
    }
    print(status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    if (mounted == true) {
      setState(() {
        steps = 'Step Count not available' as double;
      });
    }
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

  void onStepsChanged(double value) {
    if (mounted == true) {
      setState(() {
        steps = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 2000,
      enableLoadingAnimation: true,
      backgroundColor: Colors.white,
      axes: <RadialAxis>[
        RadialAxis(
          centerX: 0.5,
          centerY: 0.4,
          showLabels: false,
          showTicks: false,
          radiusFactor: 1,
          startAngle: 90,
          endAngle: 90,
          minimum: 90,
          maximum: 10000,
          axisLineStyle:
              AxisLineStyle(cornerStyle: CornerStyle.startCurve, thickness: 10),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                angle: 90,
                positionFactor: 0,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FaIcon(
                        status == 'walking'
                            ? FontAwesomeIcons.walking
                            : status == 'stopped'
                                ? FontAwesomeIcons.male
                                : FontAwesomeIcons.bed,
                        size: 27,
                        color: Colors.green),
                    Text(steps.toInt().toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Text(
                        'Steps ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )
                  ],
                ))
          ],
          pointers: <GaugePointer>[
            RangePointer(
              value: steps,
              width: 10,
              onValueChangeEnd: onStepsChanged,
              enableAnimation: true,
              animationDuration: 3000,
              cornerStyle: CornerStyle.bothCurve,
              color: const Color(0xFFFE5943),
            ),
            MarkerPointer(
              value: steps,
              onValueChangeEnd: onStepsChanged,
              enableAnimation: true,
              markerHeight: 15,
              markerWidth: 15,
              animationDuration: 3000,
              color: Colors.lightBlue,
              markerType: MarkerType.circle,
            ),
          ],
        ),
      ],
    );
  }
}
