import 'package:flutter/material.dart';
import 'package:health_track/Screens/Cards/Walk/radial_data.dart';
// import 'package:health_track/Screens/Dashboard/components/category.dart';
// import 'package:health_track/Screens/Dashboard/components/category.dart';
import 'package:health_track/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CategoryCard extends StatefulWidget {
  final String type;
  final String img;
  final Function press;
  // final CategoryData categoryData;

  const CategoryCard({
    Key key,
    this.type,
    this.img,
    this.press,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shadowColor: kDashboardPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      // for on clickabe function
      child: InkWell(
        onTap: widget.press,
        child: Container(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
