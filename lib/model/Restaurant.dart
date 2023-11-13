import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String image;
  double rating;
  String description;
  String address;
  double longitude;
  double latitude;
  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurant_id': id,
      'restaurant_name': name,
      'restaurant_image': image,
      'restaurant_rating': rating,
      'restaurant_description': description,
      'restaurant_address': address,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['restaurant_id'] ?? '',
      name: map['restaurant_name'] ?? '',
      image: map['restaurant_image'] ?? '',
      rating: map['restaurant_rating']?.toDouble() ?? 0.0,
      address: map['restaurant_address'] +
              ', ' +
              map['location_name'] +
              ', ' +
              map['location_region'] ??
          '',
      description: map['restaurant_description'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'restaurant(restaurant_id: $id, restaurant_name: $name, restaurant_image: $image, restaurant_rating: $rating, restaurant_description: $description, restaurant_address: $address, longitude: $longitude, latitude: $latitude)';
  }

  // static Future<List<String>> getAllImage(String folder) async {
  //   List<String> list = [];
  //   final manifestContent = await rootBundle.loadString('AssetManifest.json');
  //   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  //   var pathImage = 'assets/images/$folder/';
  //   final imagePaths =
  //       manifestMap.keys.where((String key) => key.contains(pathImage));

  //   for (final imagePath in imagePaths) {
  //     final fileName = path.basename(imagePath);
  //     list.add(fileName);
  //   }
  //   return list;
  // }
}
