import 'package:flutter/material.dart';
import 'package:health_track/components/Slidable%20Widget/data.dart';
import 'package:health_track/components/Slidable%20Widget/slide_model.dart';
import 'package:health_track/components/buttons.dart';
import 'package:health_track/components/list_widget.dart';
import 'package:health_track/constants.dart';

import 'Record_BP/record_bp.dart';

class BPBody extends StatefulWidget {
  @override
  _BPBodyState createState() => _BPBodyState();
}

class _BPBodyState extends State<BPBody> {
  final List<Data> data = DataList.getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardPurple,
      body: ListView(
        children: [
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
                  'Blood Pressure',
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
            height: MediaQuery.of(context).size.height - 100.0,
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
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 270.0,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              data.removeAt(index);
                            });
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                      "Are you sure you wish to delete this record?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text("DELETE")),
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("CANCEL"),
                                    ),
                                  ],
                                );
                              },
                            );
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
                  txt: 'Record Manually',
                  fontsize: 17,
                  color: kDashboardPurple,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecordBP(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
