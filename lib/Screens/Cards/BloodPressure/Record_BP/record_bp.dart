import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_track/components/dashed_divider.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';
import 'package:health_track/components/buttons.dart';

class RecordBP extends StatefulWidget {
  @override
  _RecordBPState createState() => _RecordBPState();
}

class _RecordBPState extends State<RecordBP> {
  double _systolicvalue = 120;
  double _diastolicvalue = 90;

  @override
  Widget build(BuildContext context) {
    //Display Date and Time
    DateTime now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 10.0,
        backgroundColor: kDashboardPurple,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        title: Text(
          'Record Blood Pressure',
        ),
      ),
      body: Column(
        children: [
          OutlinedBox(
            text: DateFormat.yMMMMEEEEd().format(now),
            color: Colors.black,
            fontsize: 15,
            press: () {},
          ),
          DashedDivider(
            text: 'Systolic (mmHg)',
            color: Colors.grey[700],
            fontsize: 15,
          ),
          Container(
            height: 165,
            child: SfSliderTheme(
              data: SfSliderThemeData(
                overlayRadius: 25,
                tooltipBackgroundColor: kDashboardPurple,
                trackCornerRadius: 5,
                activeTrackHeight: 5,
                inactiveTrackHeight: 5,
                tooltipTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                activeLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                inactiveLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              child: SfSlider(
                min: 80.0,
                max: 200.0,
                interval: 20,
                showLabels: true,
                showTicks: true,
                showTooltip: true,
                minorTicksPerInterval: 1,
                activeColor: kDashboardPurple,
                tooltipShape: SfPaddleTooltipShape(),
                value: _systolicvalue,
                onChanged: (dynamic newValue) {
                  setState(() {
                    _systolicvalue = newValue;
                  });
                },
                numberFormat: NumberFormat('#'),
              ),
            ),
          ),
          DashedDivider(
            text: 'Diastolic (mmHg)',
            color: Colors.grey[700],
            fontsize: 15,
          ),
          Container(
            height: 160,
            child: SfSliderTheme(
              data: SfSliderThemeData(
                overlayRadius: 25,
                tooltipBackgroundColor: kDashboardPurple,
                trackCornerRadius: 5,
                activeTrackHeight: 5,
                inactiveTrackHeight: 5,
                tooltipTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                activeLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                inactiveLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              child: SfSlider(
                min: 40.0,
                max: 120.0,
                interval: 20,
                showLabels: true,
                showTicks: true,
                showTooltip: true,
                minorTicksPerInterval: 1,
                activeColor: kDashboardPurple,
                tooltipShape: SfPaddleTooltipShape(),
                value: _diastolicvalue,
                onChanged: (dynamic newValue) {
                  setState(() {
                    _diastolicvalue = newValue.roundToDouble();
                  });
                },
                numberFormat: NumberFormat('#'),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "$_systolicvalue/$_diastolicvalue mmHg",
                  //   style: TextStyle(
                  //     color: Colors.red,
                  //     fontSize: 35.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 45,
                  ),
                  Text(
                    _systolicvalue.toInt().toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "/",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    _diastolicvalue.toInt().toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "mmHg",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: FNButton(
              txt: 'Save',
              color: kDashboardPurple,
              fontsize: 17,
              press: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
