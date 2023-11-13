import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/API/restaurantAPI.dart';
import 'package:travel/API/generalAPI.dart';
import 'package:travel/model/Restaurant.dart';

class testAPI extends StatefulWidget {
  const testAPI({super.key});

  @override
  State<testAPI> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<testAPI> {
  List<Restaurant> tours = [];
  String url = "bbq";
  List<String> images = [];

  Future<void> loadImage() async {
    images = await GeneralAPI.getAllImage(url);
  }

  @override
  void initState() {
    super.initState();
    print(url);
    loadImage();
    RestaurantAPI.fetchRestaurant("hot").then((dataFromServer) {
      setState(() {
        tours = dataFromServer;
        print(images);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: tours.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    setState(() async {
                      // url = tours[index].image;
                      // await Future.delayed(Duration(seconds: 3));
                    });
                  },
                  child: Column(children: [
                    Text(tours[index].name),
                    Text(tours[index].address),
                    // Image.asset("assets/images/${tours[index].image}.png")
                    for (String img in images)
                      Text("assets/images/${tours[index].image}/$img"),
                  ]),
                )),
          );
        },
      ),
    );
  }
}
