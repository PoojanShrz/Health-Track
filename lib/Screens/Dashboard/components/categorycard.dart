import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_track/constants.dart';

class CategoryCard extends StatefulWidget {
  final String type;
  final String img;
  final Function press;
  final Widget child;
  // final CategoryData categoryData;

  const CategoryCard({
    Key key,
    this.type,
    this.img,
    this.press,
    this.child,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    var child;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 7,

      shadowColor: kDashboardPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      // for on clickabe function
      child: InkWell(
        onTap: widget.press,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Text(
                  widget.type,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                trailing: Image.asset(
                  widget.img,
                  scale: 2.5,
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(15),
                  constraints: BoxConstraints.tightFor(width: 200),
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
