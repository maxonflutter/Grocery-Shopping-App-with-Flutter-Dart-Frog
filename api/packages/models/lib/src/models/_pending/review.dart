// import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

// class Review extends Equatable {
//   final String id;
//   final String userId;
//   final String productId;
//   final int rating;
//   final String text;
//   final DateTime date;

//   Review({
//     required this.id,
//     required this.userId,
//     required this.productId,
//     required this.rating,
//     required this.text,
//     required this.date,
//   });

//   Review copyWith({
//     String? id,
//     String? userId,
//     String? productId,
//     int? rating,
//     String? text,
//     DateTime? date,
//   }) {
//     return Review(
//       id: id ?? this.id,
//       userId: userId ?? this.userId,
//       productId: productId ?? this.productId,
//       rating: rating ?? this.rating,
//       text: text ?? this.text,
//       date: date ?? this.date,
//     );
//   }

//   @override
//   List<Object?> get props => [id, userId, productId, rating, text, date];

//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       id: json['id'] ?? '',
//       userId: json['userId'] ?? '',
//       productId: json['productId'] ?? '',
//       rating: json['rating'] ?? 0,
//       text: json['text'] ?? '',
//       date: DateTime.parse(json['date'] ?? ''),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'userId': userId,
//         'productId': productId,
//         'rating': rating,
//         'text': text,
//         'date': date.toIso8601String(),
//       };

//   static List<Review> sampleData = [
//     Review(
//       id: Uuid().v4(),
//       userId: Uuid().v4(),
//       productId: Uuid().v4(),
//       rating: 5,
//       text: 'Great product!',
//       date: DateTime.now(),
//     ),
//     Review(
//       id: Uuid().v4(),
//       userId: Uuid().v4(),
//       productId: Uuid().v4(),
//       rating: 4,
//       text: 'Good quality, but a bit pricey.',
//       date: DateTime.now(),
//     ),
//   ];
// }
