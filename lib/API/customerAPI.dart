import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:travel/model/Customer.dart';

class customerAPI {
  static parseCustomer(dynamic responseBody) {
    List<Customer> tickets = [];
    List<dynamic> list = [];
    try {
      list = json.decode(responseBody);
      tickets = list.map((model) => Customer.fromMap(model)).toList();
    } catch (e) {
      print(e.toString());
    }
    Customer customer = tickets[0];
    print(customer);
    return customer;
  }

  static checkUserLogin(String name, String email, String image) async {
    var url = '${host}insertCustomer';
    // Map<String, String> data = {

    //   // Thêm các cặp key-value tương ứng với tham số và giá trị của bạn
    // };
    final response = await http.post(Uri.parse(url), body: {
      'customer_name': name,
      'customer_email': email,
      'customer_phone': "000",
      'customer_image': image
    });
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
