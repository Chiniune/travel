import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel/model/Ticket.dart';
import 'package:http/http.dart' as http;
import 'package:travel/config/constants.dart';

class ticketAPI {
  static String all = host + "getTicket";
  static String limit = host + "limitTicket";

  static List<Ticket> parseTicket(dynamic responseBody) {
    List<Ticket> tickets = [];
    List<dynamic> list = [];
    try {
      list = json.decode(responseBody);
      tickets = list.map((model) => Ticket.fromMap(model)).toList();
    } catch (e) {
      print(e.toString());
    }
    return tickets;
  }

  static Future<List<Ticket>> fetchTicket(type) async {
    var response;
    try {
      if (type == "all") {
        response = await http.get(Uri.parse(all));
        // print("body");
        // print(response.body);
      }
      if (type == 'limit') {
        response = await http.get(Uri.parse(limit));
        // print("body");
        // print(response.body);
      }
    } catch (e) {
      print("1 $e");
    }
    try {
      if (response.statusCode == 200) {
        String responseBody = response.body;
        return compute(parseTicket, responseBody);
      } else {
        throw Exception("Can't get Tour");
      }
    } catch (e) {
      print("3 $e");
    }
    throw Exception("Exception");
  }

  static Future<List<dynamic>> getRegionItem(String id) async {
    const url = '${host}getByRegion';

    final response = await http.post(Uri.parse(url), body: {
      'location_id': id,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return compute(parseTicket, response.body);
    } else {
      print('Error: ${response.statusCode}');
    }

    return [];
  }
}
