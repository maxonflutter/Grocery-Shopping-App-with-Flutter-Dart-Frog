// import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';
// import 'address.dart';

// class User extends Equatable {
//   final String id;
//   final String username;
//   final String email;
//   final String fullName;
//   final String phoneNumber;
//   final List<Address> addresses;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   const User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.fullName,
//     required this.phoneNumber,
//     required this.addresses,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   User copyWith({
//     String? id,
//     String? username,
//     String? email,
//     String? fullName,
//     String? phoneNumber,
//     List<Address>? addresses,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return User(
//       id: id ?? this.id,
//       username: username ?? this.username,
//       email: email ?? this.email,
//       fullName: fullName ?? this.fullName,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       addresses: addresses ?? this.addresses,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }

//   @override
//   List<Object> get props => [
//         id,
//         username,
//         email,
//         fullName,
//         phoneNumber,
//         addresses,
//         createdAt,
//         updatedAt
//       ];

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? '',
//       username: json['username'] ?? '',
//       email: json['email'] ?? '',
//       fullName: json['fullName'] ?? '',
//       phoneNumber: json['phoneNumber'] ?? '',
//       addresses: (json['addresses'] as List)
//           .map(
//             (i) => Address.fromJson(i),
//           )
//           .toList(),
//       createdAt: DateTime.parse(json['createdAt'] ?? ''),
//       updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'email': email,
//       'fullName': fullName,
//       'phoneNumber': phoneNumber,
//       'addresses': addresses.map((address) => address.toJson()).toList(),
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   static List<User> sampleData = [
//     User(
//       id: Uuid().v4(),
//       username: 'john_doe',
//       email: 'john_doe@gmail.com',
//       fullName: 'John Doe',
//       phoneNumber: '+1234567890',
//       addresses: [Address.sampleData[0]],
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     ),
//     User(
//       id: Uuid().v4(),
//       username: 'jane_doe',
//       email: 'jane_doe@gmail.com',
//       fullName: 'Jane Doe',
//       phoneNumber: '+0987654321',
//       addresses: [Address.sampleData[1]],
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     ),
//   ];
// }
