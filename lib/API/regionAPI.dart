import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel/model/Region.dart';
import 'package:travel/config/constants.dart';
import 'package:http/http.dart' as http;

class regionAPI {
  static String getAllURL = "${host}getRegion";

  static List<Region> parseRegion(dynamic responseBody) {
    List<Region> locs = [];
    List<dynamic> list = [];
    try {
      list = json.decode(responseBody);
      locs = list.map((model) => Region.fromMap(model)).toList();
    } catch (e) {
      print(e.toString());
    }
    return locs;
  }

  static Future<List<Region>> fetchRegion() async {
    var response;
    try {
      response = await http.get(Uri.parse(getAllURL));
    } catch (e) {
      print("1 $e");
    }
    try {
      if (response.statusCode == 200) {
        return compute(parseRegion, response.body);
      } else {
        throw Exception("Can't get Tour");
      }
    } catch (e) {
      print("3 $e");
    }
    throw Exception("Exception");
  }
}
