import 'package:flutter/material.dart';
import 'package:health_track/constants.dart';

class FNButton extends StatelessWidget {
  final String txt;
  final Function press;
  final double fontsize;
  final Color color, txtColor;

  const FNButton({
    Key key,
    this.txt,
    this.press,
    this.color = kPrimaryColor,
    this.txtColor = Colors.white,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          // padding: EdgeInsets.symmetric(vertical: 15),
          onPressed: press,
          child: Text(
            txt,
            style: TextStyle(color: txtColor, fontSize: fontsize),
          ),
        ),
      ),
    );
  }
}
