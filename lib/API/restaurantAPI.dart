import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel/model/Restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:travel/config/constants.dart';

class RestaurantAPI {
  static String all = host + "getAllRestaurant";
  static String hot = host + "getHotRestaurant";

  static List<Restaurant> parseRestaurant(dynamic responseBody) {
    List<Restaurant> res = [];
    List<dynamic> list = [];
    try {
      list = json.decode(responseBody);
      res = list.map((model) => Restaurant.fromMap(model)).toList();
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  static Future<List<Restaurant>> fetchRestaurant(type) async {
    var response;
    try {
      if (type == "all") {
        response = await http.get(Uri.parse(all));
        // print("body");
        // print(response.body);
      }
      if (type == 'hot') {
        response = await http.get(Uri.parse(hot));
        // print("body");
        // print(response.body);
      }
    } catch (e) {
      print("1 $e");
    }
    try {
      if (response.statusCode == 200) {
        String responseBody = response.body;
        return compute(parseRestaurant, responseBody);
      } else {
        throw Exception("Can't get Tour");
      }
    } catch (e) {
      print("3 $e");
    }
    throw Exception("Exception");
  }
}
