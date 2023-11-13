import 'package:flutter/material.dart';
import 'package:travel/model/Region.dart';
import 'package:travel/view/item/viewAll.dart';

class regionItem extends StatelessWidget {
  List<Region> lists;
  regionItem({required this.lists});
  @override
  Widget build(BuildContext context) {
    return _buildRegion(context);
  }

  Column _buildRegion(context) {
    List<Widget> regions = [];
    lists.forEach((item) {
      regions.add(
        Container(
          height: 80.0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => viewAllUI(id: item.id)));
            },
            child: Center(
              child: ListTile(
                leading: Container(
                  child: Image(image: AssetImage("assets/images/region.png")),
                ),
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  item.region,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: InkResponse(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFFFAF6F1),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
    return Column(children: regions);
  }
}
