import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isPopular;
  final bool isTrending;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    this.isPopular = false,
    this.isTrending = false,
  });

  static const empty = Product(
    id: '',
    name: '',
    description: '',
    price: 0.0,
    imageUrl: '',
    categoryId: '',
  );

  @override
  List<Object> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        categoryId,
        isPopular,
        isTrending
      ];

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryId,
    bool? isPopular,
    bool? isTrending,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      isPopular: isPopular ?? this.isPopular,
      isTrending: isTrending ?? this.isTrending,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? Uuid().v4(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0.0,
      imageUrl:
          json['imageUrl'] ?? 'https://source.unsplash.com/random/?product',
      categoryId: json['categoryId'] ?? '',
      isPopular: json['isPopular'] ?? false,
      isTrending: json['isTrending'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'isPopular': isPopular,
      'isTrending': isTrending,
    };
  }

  static List<Product> sampleData = [
    Product(
      id: Uuid().v4(),
      name: 'Banana',
      description: 'A delicious and healthy fruit',
      price: 0.99,
      imageUrl: 'https://source.unsplash.com/random/?banana',
      categoryId: '1',
      isPopular: true,
      isTrending: false,
    ),
    // Add more sample data here
  ];
}
