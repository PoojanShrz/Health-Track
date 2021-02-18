import 'package:flutter/material.dart';

class OutlinedBox extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Function press;

  const OutlinedBox({
    Key key,
    @required this.text,
    @required this.fontsize,
    @required this.color,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: OutlineButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: fontsize),
          ),
          borderSide: BorderSide(
              color: Colors.grey[600], width: 3, style: BorderStyle.solid),
          onPressed: press,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
