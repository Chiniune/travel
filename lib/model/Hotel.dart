import 'dart:convert';

class Hotel {
  String id;
  String name;
  String image;
  double rating;
  String description;
  String address;
  double longitude;
  double latitude;
  Hotel({
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
      'hotel_id': id,
      'hotel_name': name,
      'hotel_image': image,
      'hotel_rating': rating,
      'hotel_description': description,
      'hotel_address': address,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: map['hotel_id'] ?? '',
      name: map['hotel_name'] ?? '',
      image: map['hotel_image'] ?? '',
      rating: map['hotel_rating']?.toDouble() ?? 0.0,
      address: map['hotel_address'] +
              ', ' +
              map['location_name'] +
              ', ' +
              map['location_region'] ??
          '',
      description: map['hotel_description'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) => Hotel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hotel(hotel_id: $id, hotel_name: $name, hotel_image: $image, hotel_rating: $rating, hotel_description: $description, hotel_address: $address, longitude: $longitude, latitude: $latitude)';
  }

  // static Future<List<String>> getAllImage(String folder) async {
  //   List<String> list = [];
  //   final manifestContent = await rootBundle.loadString('AssetManifest.json');
  //   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  //   var pathImage = 'assets/images/$folder/';
  //   final imagePaths = manifestMap.keys.where((String key) => key.contains(pathImage));

  //   for (final imagePath in imagePaths) {
  //     final fileName = path.basename(imagePath);
  //     list.add(fileName);
  //   }
  //   print(list);
  //   return list;
  // }
}
