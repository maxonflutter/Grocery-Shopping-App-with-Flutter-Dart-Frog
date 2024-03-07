// import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

// class Aisle extends Equatable {
//   final String id;
//   final String name;
//   final String description;

//   const Aisle({
//     required this.id,
//     required this.name,
//     required this.description,
//   });

//   Aisle copyWith({String? id, String? name, String? description}) {
//     return Aisle(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       description: description ?? this.description,
//     );
//   }

//   @override
//   List<Object> get props => [id, name, description];

//   factory Aisle.fromJson(Map<String, dynamic> json) {
//     return Aisle(
//       id: json['id'] ?? '',
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'description': description,
//       };

//   static List<Aisle> sampleData = [
//     Aisle(
//       id: const Uuid().v4(),
//       name: 'Fruits & Vegetables',
//       description: 'Fresh produce',
//     ),
//     Aisle(
//       id: const Uuid().v4(),
//       name: 'Dairy',
//       description: 'Milk, cheese, eggs and more',
//     ),
//     Aisle(
//       id: const Uuid().v4(),
//       name: 'Bakery',
//       description: 'Bread, pastries, cakes',
//     ),
//   ];
// }
