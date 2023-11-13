import 'package:flutter/material.dart';
import '../../main.dart' as Main;
import 'cityUI.dart';
import '../../config/color.dart';

class dealItem extends StatelessWidget {
  List<CityUI> cities = CityUI.cityList();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          height: size.height * .8,
          child: ListView.builder(
              itemBuilder: (context, index) => cities[index],
              shrinkWrap: true,
              padding: EdgeInsets.all(0.0),
              itemCount: cities.length,
              scrollDirection: Axis.vertical),
        ),
      ],
    );
    ;
  }
}
