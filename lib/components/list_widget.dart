import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_track/components/Slidable%20Widget/data.dart';

class DataCard extends StatelessWidget {
  final Data data;
  DataCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: FaIcon(data.icon),
            title: Text(data.title),
            subtitle: Text(data.date),
          )
        ],
      ),
    );
  }
}
