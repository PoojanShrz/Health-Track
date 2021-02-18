import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;

  const DashedDivider({
    Key key,
    @required this.text,
    @required this.fontsize,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: FDottedLine(
              color: Colors.grey,
              strokeWidth: 2.0,
              dottedLength: 10.0,
              space: 2.0,
              height: 1,
            )),
      ),
      Text(
        text,
        style: TextStyle(color: color, fontSize: fontsize),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: FDottedLine(
              color: Colors.grey,
              strokeWidth: 2.0,
              dottedLength: 10.0,
              space: 2.0,
              height: 1,
            )),
      ),
    ]);
  }
}
