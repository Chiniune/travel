import 'dart:convert';

class Test {
  String name;
  String city;
  Test({
    required this.name,
    required this.city,
  });

  Test copyWith({
    String? name,
    String? city,
  }) {
    return Test(
      name: name ?? this.name,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'city': city,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      name: map['name'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source));

  @override
  String toString() => 'Test(name: $name, city: $city)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Test && other.name == name && other.city == city;
  }
}
