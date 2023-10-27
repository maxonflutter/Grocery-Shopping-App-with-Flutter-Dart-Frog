// import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

// enum PaymentStatus { completed, pending }

// class Payment extends Equatable {
//   final String id;
//   final String orderId;
//   final String userId;
//   final double amount;
//   final DateTime createdAt;
//   final PaymentStatus status;

//   const Payment({
//     required this.id,
//     required this.orderId,
//     required this.userId,
//     required this.amount,
//     required this.createdAt,
//     required this.status,
//   });

//   Payment copyWith({
//     String? id,
//     String? orderId,
//     String? userId,
//     double? amount,
//     DateTime? createdAt,
//     PaymentStatus? status,
//   }) {
//     return Payment(
//       id: id ?? this.id,
//       orderId: orderId ?? this.orderId,
//       userId: userId ?? this.userId,
//       amount: amount ?? this.amount,
//       createdAt: createdAt ?? this.createdAt,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props => [id, orderId, userId, amount, createdAt, status];

//   factory Payment.fromJson(Map<String, dynamic> json) {
//     return Payment(
//       id: json['id'] ?? '',
//       orderId: json['orderId'] ?? '',
//       userId: json['userId'] ?? '',
//       amount: json['amount'] ?? 0.0,
//       createdAt: DateTime.parse(json['createdAt'] ?? ''),
//       status: PaymentStatus.values.firstWhere(
//           (e) => e.toString() == 'PaymentStatus.' + (json['status'] ?? ''),
//           orElse: () => PaymentStatus.pending),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'orderId': orderId,
//         'userId': userId,
//         'amount': amount,
//         'createdAt': createdAt.toIso8601String(),
//         'status': status.toString().split('.').last,
//       };

//   static List<Payment> sampleData = [
//     Payment(
//       id: Uuid().v4(),
//       orderId: Uuid().v4(),
//       userId: Uuid().v4(),
//       amount: 123.45,
//       createdAt: DateTime.now(),
//       status: PaymentStatus.completed,
//     ),
//     Payment(
//       id: Uuid().v4(),
//       orderId: Uuid().v4(),
//       userId: Uuid().v4(),
//       amount: 67.89,
//       createdAt: DateTime.now(),
//       status: PaymentStatus.pending,
//     ),
//   ];
// }
