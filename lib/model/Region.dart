import 'dart:convert';

class Region {
  String id;
  String name;
  String region;
  Region({
    required this.id,
    required this.name,
    required this.region,
  });

  Map<String, dynamic> toMap() {
    return {
      'location_id': id,
      'location_name': name,
      'location_region': region,
    };
  }

  factory Region.fromMap(Map<String, dynamic> map) {
    return Region(
      id: map['location_id'] ?? '',
      name: map['location_name'] ?? '',
      region: map['location_region'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Region.fromJson(String source) => Region.fromMap(json.decode(source));

  @override
  String toString() => 'Location(id: $id, name: $name, region: $region)';
}
