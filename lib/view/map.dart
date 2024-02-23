import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel/API/generalAPI.dart';
import 'package:travel/config/color.dart';
import '../config/constants.dart';
import 'package:location/location.dart';

class MapsUI extends StatefulWidget {
  double longitude;
  double latitude;
  MapsUI({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  @override
  State<MapsUI> createState() =>
      _MapsUIState(latitude: latitude, longitude: longitude);
}

class _MapsUIState extends State<MapsUI> {
  double longitude;
  double latitude;
  late LatLng destination;
  _MapsUIState({required this.latitude, required this.longitude}) {
    destination = LatLng(latitude, longitude);
  }

  List<LatLng> polyLineCoordinates = [];
  // LocationData? currentlocation;

  // Future<void> getCurrentLocation() async {
  //   Location location = Location();
  //   await location.getLocation().then((location) {
  //     setState(() {
  //       currentlocation = location;
  //       print(currentlocation);
  //     });
  //   });
  // }

  double currentLat = GeneralAPI.currentLatitude;
  double currentLong = GeneralAPI.currentLongitude;

  // Future<void> getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       google_API_KEY,
  //       PointLatLng(15.9794904, 108.2476768),
  //       PointLatLng(15.9790398, 108.2497612));
  //   print("ham get poly");
  //   print(result.points.isEmpty);
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) => polyLineCoordinates.add(
  //           LatLng(point.latitude, point.longitude),
  //         ));
  //     setState(() {});
  //     print("trong if");
  //   }
  //   print(polyLineCoordinates);
  // }

  @override
  void initState() {
    // getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentLat == 0.0
        ? Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                "loading...",
              ),
            ),
          )
        : GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(currentLat, currentLong), zoom: 12),
            // polylines: {
            //     Polyline(
            //         polylineId: PolylineId("route"),
            //         points: polyLineCoordinates,
            //         color: primaryColor,
            //         width: 5)
            //   },
            markers: {
                Marker(
                    markerId: const MarkerId("CurrentLocation"),
                    position: LatLng(currentLat, currentLong)),
                Marker(
                    markerId: const MarkerId("destination"),
                    position: destination),
              });
  }
}
//currentlocation!.latitude!, currentlocation!.longitude!