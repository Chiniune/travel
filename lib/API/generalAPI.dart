import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location/location.dart';
import 'package:path/path.dart' as path;
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/API/hotelAPI.dart';
import 'package:travel/API/restaurantAPI.dart';
import 'package:travel/API/ticketAPI.dart';
import 'package:travel/config/constants.dart';
import 'package:http/http.dart' as http;

class GeneralAPI {
  // store user information
  Future<void> saveUserCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

// get user information when login
  Future<Map<String, String>> getUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    String password = prefs.getString('password') ?? '';
    return {'username': username, 'password': password};
  }

  // get all image from folder of object
  static Future<List<String>> getAllImage(String folder) async {
    List<String> list = [];
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    var pathImage = 'assets/images/$folder/';
    final imagePaths =
        manifestMap.keys.where((String key) => key.contains(pathImage));

    for (final imagePath in imagePaths) {
      final fileName = path.basename(imagePath);
      list.add("assets/images/$folder/$fileName");
    }
    return list;
  }

  //get current location
  static double currentLongitude = 0;
  static double currentLatitude = 0;
  static Future<void> setCurrentLocation() async {
    geolocator.LocationPermission permission =
        await geolocator.Geolocator.checkPermission();

    if (permission == geolocator.LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
    }
    geolocator.Position currentPosition =
        await geolocator.Geolocator.getCurrentPosition(
      desiredAccuracy: geolocator.LocationAccuracy.high,
    );
    currentLatitude = currentPosition.latitude;
    currentLongitude = currentPosition.longitude;
  }

  // calculate space between current location and destination
  static Future<double> getSpaceOnMaps(double lat, double long) async {
    //calculate
    double distanceInMeters = await geolocator.Geolocator.distanceBetween(
      currentLatitude,
      currentLongitude,
      lat,
      long,
    );
    double distanceInKm =
        distanceInMeters / 1000; // Convert meters to kilometers
    double format = double.parse(
        distanceInKm.toStringAsFixed(1)); // format: remove numbers after .
    return format;
  }

  // compare space to get nearest list
  static double space = 0;
  static getSpaceCompare(double lat, double long) {
    getSpaceOnMaps(lat, long).then((result) {
      space = result;
    });
  }

  //get list nearest
  static Future<List> getNeartList(List lists) async {
    List nearests = [];
    for (var item in lists) {
      await getSpaceCompare(item.latitude, item.longitude);
      if (space <= 15.0) {
        nearests.add(item);
      }
    }
    return nearests;
  }

  // static Future<List<dynamic>> getRegionItem(String type, String id) async {
  //   const url = '${host}getByRegion';

  //   http.post(Uri.parse(url), body: {
  //     'type': type,
  //     'location_id': id,
  //   }).then((response) {
  //     if (response.statusCode == 200) {
  //       if (type == 'tickets') {
  //         // return compute(ticketAPI.parseTicket, response.body);
  //         print(response.body);
  //       } else if (type == 'hotels') {
  //         // return compute(HotelAPI.parseHotel, response.body);
  //         print(response.body);
  //       } else if (type == 'restaurants') {
  //         // return compute(RestaurantAPI.parseRestaurant, response.body);
  //         print(response.body);
  //       }
  //     } else {
  //       print('Error: ${response.statusCode}');
  //     }
  //   }).catchError((error) {
  //     print('Error: $error');
  //   });
  //   throw new Exception("Exxception");
  // }
}
