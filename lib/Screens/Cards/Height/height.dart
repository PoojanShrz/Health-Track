import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/components/Slidable%20Widget/data.dart';
import 'package:health_track/components/Slidable%20Widget/slidable_widget.dart';
import 'package:health_track/components/Slidable%20Widget/slide_model.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/components/dashed_divider.dart';
import 'package:health_track/components/list_widget.dart';
import 'package:health_track/components/outlined_box.dart';
import 'package:health_track/constants.dart';
import 'package:intl/intl.dart';

enum HeightUnit { ft, cm }

class Height extends StatefulWidget {
  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  final List<Data> data = DataList.getData();

  HeightUnit selectedUnit = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  int ft = 0;
  int inches = 0;
  String cm;

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    print('$ft feet and $inches inches');
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    heightController.text = cm;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        heightController.text = '$ft\' $inches"';
      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        print(heightController.text);
        inchesToCm();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Scaffold(
        backgroundColor: kDashboardPurple,
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Height',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height - 140.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 20),
              children: [
                OutlinedBox(
                  text: DateFormat.yMMMMEEEEd().format(now),
                  color: Colors.black,
                  fontsize: 15,
                  press: () {},
                ),
                DashedDivider(
                  text: 'Height (ft/cm)',
                  color: Colors.grey[700],
                  fontsize: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 168,
                        child: TextFormField(
                          onTap: selectedUnit == HeightUnit.ft
                              ? () {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, top: 7),
                                              color: Colors.white,
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Set Height",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "Gilroy",
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      backgroundColor:
                                                          Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 170,
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: CupertinoPicker(
                                                      itemExtent: 35.0,
                                                      onSelectedItemChanged:
                                                          (int index) {
                                                        print(index + 1);
                                                        setState(() {
                                                          ft = (index + 1);
                                                          heightController
                                                                  .text =
                                                              "$ft' $inches\"";
                                                        });
                                                      },
                                                      children: List.generate(
                                                          12, (index) {
                                                        return Center(
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Gilroy"),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Center(
                                                          child: Text('ft',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Gilory",
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize: 22,
                                                                color: Colors
                                                                    .black,
                                                              )))),
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      itemExtent: 32.0,
                                                      onSelectedItemChanged:
                                                          (int index) {
                                                        print(index);
                                                        setState(() {
                                                          inches = (index);
                                                          heightController
                                                                  .text =
                                                              "$ft' $inches\"";
                                                        });
                                                      },
                                                      children: List.generate(
                                                          12, (index) {
                                                        return Center(
                                                          child: Text(
                                                            '$index',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Gilroy"),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Center(
                                                        child: Text('inches',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Gilroy",
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.black,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              : null,
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Color(0xFF4C4ED7),
                          style: TextStyle(fontSize: 27),
                          decoration: InputDecoration(
                              icon: FaIcon(
                                FontAwesomeIcons.child,
                                color: kDashboardPurple,
                                size: 30,
                              ),
                              hintText: selectedUnit == HeightUnit.ft
                                  ? "__' __\""
                                  : '__',
                              hintStyle: TextStyle(
                                color: Color(0xFF4C4ED7),
                                fontSize: 20,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (heightController.text.isEmpty) {
                                selectedUnit = HeightUnit.ft;
                              } else {
                                selectedUnit = HeightUnit.ft;
                                checkHeightUnit();
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: selectedUnit == HeightUnit.ft
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                              color: Colors.transparent,
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                                child:
                                    Text('ft', style: TextStyle(fontSize: 20))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (heightController.text.isEmpty) {
                                selectedUnit = HeightUnit.cm;
                              } else {
                                selectedUnit = HeightUnit.cm;
                                checkHeightUnit();
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: selectedUnit == HeightUnit.cm
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                              color: Colors.transparent,
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                                child:
                                    Text('cm', style: TextStyle(fontSize: 20))),
                          ),
                        ),
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height - 400.0,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              data.removeAt(index);
                            });
                          },
                          background: Container(
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            color: Colors.red,
                          ),
                          key: UniqueKey(),
                          child: DataCard(
                            data: data[index],
                          ),
                          direction: DismissDirection.startToEnd,
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 5,
                  thickness: 2,
                ),
                FNButton(
                  txt: 'Save',
                  fontsize: 15,
                  color: kDashboardPurple,
                  press: () {},
                ),
              ],
            ),
          ),
        ]));
  }
}
