import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Address extends Equatable {
  final String id;
  final String userId;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  const Address({
    required this.id,
    required this.userId,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  Address copyWith({
    String? id,
    String? userId,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props =>
      [id, userId, street, city, state, postalCode, country];

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    };
  }

  static List<Address> sampleData = [
    Address(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      street: '123 Main St',
      city: 'New York',
      state: 'NY',
      postalCode: '10001',
      country: 'USA',
    ),
    Address(
      id: const Uuid().v4(),
      userId: const Uuid().v4(),
      street: '456 Broadway',
      city: 'Los Angeles',
      state: 'CA',
      postalCode: '90001',
      country: 'USA',
    ),
  ];
}
