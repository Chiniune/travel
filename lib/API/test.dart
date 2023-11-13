import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travel/config/constants.dart';
import 'package:travel/model/Customer.dart';

class testAPI {
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

  static postData(String id) {
    const url = '${host}getcustomerByID';

    http.post(Uri.parse(url), body: {'customer_id': id}).then((response) {
      if (response.statusCode == 200) {
        // Xử lý dữ liệu trả về nếu có
        return compute(parseCustomer, response.body);
      } else {
        print('Error: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  static addData(name, email, image) {
    print(name);
    print(email);
    print(image);
    const url = '${host}insertCustomer';

    http.post(Uri.parse(url), body: {
      'customer_name': name,
      'customer_email': email,
      'customer_phone': '000',
      'customer_image': image
    }).then((response) {
      if (response.statusCode == 200) {
        // Xử lý dữ liệu trả về nếu có
        print(response.body);
      } else {
        print('Error: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  static updateData(phone, id) {
    const url = '${host}updateCustomerPhone';

    http.post(Uri.parse(url),
        body: {'customer_phone': phone, 'customer_id': id}).then((response) {
      if (response.statusCode == 200) {
        // Xử lý dữ liệu trả về nếu có
        print(response.body);
      } else {
        print('Error: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
