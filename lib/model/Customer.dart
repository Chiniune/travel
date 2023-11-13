import 'dart:convert';

class Customer {
  String id;
  String name;
  String email;
  String phone;
  String image;
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'customer_id': id,
      'customer_name': name,
      'customer_email': email,
      'customer_phone': phone,
      'customer_image': image,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['customer_id'] ?? '',
      name: map['customer_name'] ?? '',
      email: map['customer_email'] ?? '',
      phone: map['customer_phone'] ?? '',
      image: map['customer_image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, email: $email, phone: $phone, image: $image)';
  }
}
