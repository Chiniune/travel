import 'dart:convert';

class Ticket {
  String id;
  String name;
  String description;
  double price_adult;
  double price_child;
  String image;
  String promotion_id;
  String address;
  double longitude;
  double latitude;
  Ticket({
    required this.id,
    required this.name,
    required this.description,
    required this.price_adult,
    required this.price_child,
    required this.image,
    required this.promotion_id,
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  //   static List<Ticket> getTourList() {
  //   List<Ticket> list = [
  //     Ticket(
  //         "1",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img1.png",
  //         "1",
  //         "1"),
  //     Ticket(
  //         "2",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img2.png",
  //         "1",
  //         "1"),
  //     Ticket(
  //         "3",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img3.png",
  //         "1",
  //         "1"),
  //     Ticket(
  //         "4",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img4.png",
  //         "1",
  //         "1"),
  //     Ticket(
  //         "5",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img2.png",
  //         "1",
  //         "1"),
  //     Ticket(
  //         "6",
  //         "Ba Na hill",
  //         "Name: Dart Data Class Generator Id: dotup.dart-data-class-generator Description: Create dart data classes easily, fast and without writing boilerplate or running code generation. Version: 0.5.3 Publisher: dotup VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator",
  //         45,
  //         63,
  //         "assets/images/bbq/img5.png",
  //         "1",
  //         "1"),
  //   ];
  //   return list;
  // }

  // factory Ticket.fromMap(Map<String, dynamic> map) {
  //   return Ticket(
  //     ticket_id: map['ticket_id'] ?? '',
  //     ticket_name: map['ticket_name'] ?? '',
  //     ticket_description: map['ticket_description'] ?? '',
  //     ticket_price_adult: map['ticket_price_adult']?.toDouble() ?? 0.0,
  //     ticket_price_child: map['ticket_price_child']?.toDouble() ?? 0.0,
  //     ticket_image_url: map['ticket_image_url'] ?? '',
  //     ticket_promotion_id: map['ticket_promotion_id'] ?? '',
  //     ticket_location_id: map['ticket_location_id'] ?? '',
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price_adult': price_adult,
      'price_child': price_child,
      'image': image,
      'promotion_id': promotion_id,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['ticket_id'] ?? '',
      name: map['ticket_name'] ?? '',
      description: map['ticket_description'] ?? '',
      price_adult: map['ticket_price_adult']?.toDouble() ?? 0.0,
      price_child: map['ticket_price_child']?.toDouble() ?? 0.0,
      image: map['ticket_image'] ?? '',
      promotion_id: map['ticket_promotion_id'] ?? '',
      address: map['location_name'] + ', ' + map['location_region'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) => Ticket.fromMap(json.decode(source));

  String printClassName() {
    return 'tickets';
  }

  @override
  String toString() {
    return 'Ticket(id: $id, name: $name, description: $description, price_adult: $price_adult, price_child: $price_child, image: $image, promotion_id: $promotion_id, address: $address, longitude: $longitude, latitude: $latitude)';
  }
}
