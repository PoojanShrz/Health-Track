import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../constants.dart';

class RadialGaug extends StatefulWidget {
  final double data;
  final double markervalue;

  const RadialGaug({
    Key key,
    this.data,
    this.markervalue,
  }) : super(key: key);

  @override
  _RadialGaugState createState() => _RadialGaugState();
}

class _RadialGaugState extends State<RadialGaug> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        title: GaugeTitle(
          text: "Pedometer",
          textStyle: TextStyle(color: kDashboardPurple, fontSize: 40),
        ),
        axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
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
                MarkerPointer(
                  value: widget.markervalue,
                  enableAnimation: true,
                  markerHeight: 34,
                  markerWidth: 34,
                  markerType: MarkerType.circle,
                  borderWidth: 2,
                  color: Color(0xFFAD1457),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  axisValue: 0.2,
                  positionFactor: 0.1,
                  widget: Text(
                    widget.data.toInt().toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCC2B5E),
                    ),
                  ),
                ),
                GaugeAnnotation(
                    axisValue: 50,
                    positionFactor: 0.3,
                    widget: Text('/50000',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFCC2B5E))))
              ])
        ]);
  }
}
