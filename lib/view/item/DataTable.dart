import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      Center(
          child: Text(
        'Reserved ',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )),
      SizedBox(
        height: 15,
      ),
      DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
        columns: [
          DataColumn(
              label: Text('NO',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Stephen')),
            DataCell(Text('Actor')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('John')),
            DataCell(Text('Student')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('Harry')),
            DataCell(Text('Leader')),
          ]),
          DataRow(cells: [
            DataCell(Text('15')),
            DataCell(Text('Peter')),
            DataCell(Text('Scientist')),
          ]),
        ],
      ),
    ]);
  }
}
