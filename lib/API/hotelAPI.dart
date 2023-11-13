import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel/model/Hotel.dart';
import 'package:http/http.dart' as http;
import 'package:travel/config/constants.dart';

class HotelAPI {
  static String all = host + "getAllHotel";
  static String hot = host + "getHotHotel";

  static List<Hotel> parseHotel(dynamic responseBody) {
    List<Hotel> hotels = [];
    List<dynamic> list = [];
    try {
      list = json.decode(responseBody);
      hotels = list.map((model) => Hotel.fromMap(model)).toList();
    } catch (e) {
      print(e.toString());
    }
    return hotels;
  }

  static Future<List<Hotel>> fetchHotel(type) async {
    var response;
    try {
      if (type == "all") {
        response = await http.get(Uri.parse(all));
      }
      if (type == 'hot') {
        response = await http.get(Uri.parse(hot));
      }
    } catch (e) {
      print("1 $e");
    }
    try {
      if (response.statusCode == 200) {
        String responseBody = response.body;
        return compute(parseHotel, responseBody);
      } else {
        throw Exception("Can't get ticket");
      }
    } catch (e) {
      print("3 $e");
    }
    throw Exception("Exception");
  }
}
