import 'package:flutter/material.dart';
import 'package:travel/config/color.dart';

class bookingManaUI extends StatefulWidget {
  const bookingManaUI({Key? key}) : super(key: key);

  @override
  State<bookingManaUI> createState() => bookingManaState();
}

class bookingManaState extends State<bookingManaUI> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text("Booking Management",
            style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        backgroundColor: secondaryHeaderColor.shade300,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(width / 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green.shade200,
                ),
                child: Text(
                  "reserved".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 0.5)),
              child: const ExpansionTile(
                title: Text("Taco" + " Restaurant"),
                leading: Icon(Icons.restaurant), //add icon
                childrenPadding: EdgeInsets.only(left: 40), //children padding
                children: [
                  ListTile(
                      title: Text("Address: " +
                          "53 Ngo Than Thuong, Ha Nam, Ngu Hanh Son, Da Nang")),
                  ListTile(title: Text("Time: " + "15/02/2023 - 08:30")),
                  ListTile(
                      title: Text(
                          "Quantity: " + "3" + " Adult &" + "5" + " child")),
                  ListTile(
                    leading: Icon(Icons.directions),
                    title: Text("Direction"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 0.5)),
              child: const ExpansionTile(
                title: Text("Si Dining" + " Restaurant"),
                leading: Icon(Icons.restaurant), //add icon
                childrenPadding: EdgeInsets.only(left: 40), //children padding
                children: [
                  ListTile(
                      title: Text("Address: " +
                          "53 Ngo Than Thuong, Ha Nam, Ngu Hanh Son, Da Nang")),
                  ListTile(title: Text("Time: " + "15/02/2023 - 08:30")),
                  ListTile(
                      title: Text(
                          "Quantity: " + "3" + " Adult &" + "5" + " child")),
                  ListTile(
                    leading: Icon(Icons.directions),
                    title: Text("Direction"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red.shade200,
                ),
                child: Text(
                  "Accomplished".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red, width: 0.5)),
              child: const ExpansionTile(
                title: Text("Mi Quang Bep" + " Restaurant"),
                leading: Icon(Icons.restaurant), //add icon
                childrenPadding: EdgeInsets.only(left: 40), //children padding
                children: [
                  ListTile(
                      title: Text("Address: " +
                          "53 Ngo Than Thuong, Ha Nam, Ngu Hanh Son, Da Nang")),
                  ListTile(title: Text("Time: " + "15/02/2023 - 08:30")),
                  ListTile(
                      title: Text(
                          "Quantity: " + "3" + " Adult &" + "5" + " child")),
                  ListTile(
                    leading: Icon(Icons.directions),
                    title: Text("Direction"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red, width: 0.5)),
              child: const ExpansionTile(
                title: Text("Passion BBQ" + " Restaurant"),
                leading: Icon(Icons.restaurant), //add icon
                childrenPadding: EdgeInsets.only(left: 40), //children padding
                children: [
                  ListTile(
                      title: Text("Address: " +
                          "53 Ngo Than Thuong, Ha Nam, Ngu Hanh Son, Da Nang")),
                  ListTile(title: Text("Time: " + "15/02/2023 - 08:30")),
                  ListTile(
                      title: Text(
                          "Quantity: " + "3" + " Adult &" + "5" + " child")),
                  ListTile(
                    leading: Icon(Icons.directions),
                    title: Text("Direction"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red, width: 0.5)),
              child: const ExpansionTile(
                title: Text("Taco" + " Restaurant"),
                leading: Icon(Icons.restaurant), //add icon
                childrenPadding: EdgeInsets.only(left: 40), //children padding
                children: [
                  ListTile(
                      title: Text("Address: " +
                          "53 Ngo Than Thuong, Ha Nam, Ngu Hanh Son, Da Nang")),
                  ListTile(title: Text("Time: " + "15/02/2023 - 08:30")),
                  ListTile(
                      title: Text(
                          "Quantity: " + "3" + " Adult &" + "5" + " child")),
                  ListTile(
                    leading: Icon(Icons.directions),
                    title: Text("Direction"),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
