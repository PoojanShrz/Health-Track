import 'package:flutter/material.dart';
import 'package:health_track/constants.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function press;
  final double fontsize;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.fontsize,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),

          color: widget.color,
          // style: ButtonStyle(),
          onPressed: widget.press,
          child: Text(
            widget.text,
            style:
                TextStyle(color: widget.textColor, fontSize: widget.fontsize),
          ),
        ),
      ),
    );
  }
}
