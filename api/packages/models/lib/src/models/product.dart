import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String imageUrl;
  final String categoryId;
  final String aisleId;
  final int stock;
  final String unit;
  final List<String> reviews;
  final bool isPopular;
  final bool isTrending;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountedPrice,
    required this.imageUrl,
    required this.categoryId,
    required this.aisleId,
    required this.stock,
    required this.unit,
    required this.reviews,
    this.isPopular = false,
    this.isTrending = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discountedPrice,
        imageUrl,
        categoryId,
        aisleId,
        stock,
        unit,
        reviews,
        isPopular,
        isTrending,
      ];

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? discountedPrice,
    String? imageUrl,
    String? categoryId,
    String? aisleId,
    int? stock,
    String? unit,
    List<String>? reviews,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      aisleId: aisleId ?? this.aisleId,
      stock: stock ?? this.stock,
      unit: unit ?? this.unit,
      reviews: reviews ?? this.reviews,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0.0,
      discountedPrice: json['discountedPrice'] ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      categoryId: json['categoryId'] ?? '',
      aisleId: json['aisleId'] ?? '',
      stock: json['stock'] ?? 0,
      unit: json['unit'] ?? '',
      reviews: json['reviews']?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discountedPrice': discountedPrice,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'aisleId': aisleId,
      'stock': stock,
      'unit': unit,
      'reviews': reviews,
    };
  }

  static const empty = Product(
    id: '',
    name: '',
    description: '',
    price: 0.0,
    discountedPrice: 0.0,
    imageUrl: '',
    categoryId: '',
    aisleId: '',
    stock: 0,
    unit: '',
    reviews: [],
  );

  static List<Product> sampleData = [
    Product(
      id: Uuid().v4(),
      name: 'Apple',
      description: 'Fresh and juicy apples.',
      price: 1.99,
      discountedPrice: 1.49,
      imageUrl: 'https://source.unsplash.com/random/?apple',
      categoryId: '1',
      aisleId: '1',
      stock: 100,
      unit: 'kg',
      reviews: const ['Great product!', 'Very fresh.'],
      isPopular: true,
      isTrending: true,
    ),
    Product(
      id: Uuid().v4(),
      name: 'Banana',
      description: 'Sweet bananas.',
      price: 0.99,
      discountedPrice: 0.79,
      imageUrl: 'https://source.unsplash.com/random/?banana',
      categoryId: '1',
      aisleId: '1',
      stock: 200,
      unit: 'kg',
      reviews: const ['Tasty!', 'Good quality.'],
      isPopular: true,
      isTrending: true,
    ),
    Product(
      id: Uuid().v4(),
      name: 'Orange',
      description: 'Juicy and tangy oranges.',
      price: 1.49,
      discountedPrice: 1.29,
      imageUrl: 'https://source.unsplash.com/random/?orange',
      categoryId: '1',
      aisleId: '2',
      stock: 150,
      unit: 'kg',
      reviews: ['Refreshing!', 'Full of juice.'],
    ),
    Product(
      id: Uuid().v4(),
      name: 'Grapes',
      description: 'Sweet seedless grapes.',
      price: 2.49,
      discountedPrice: 1.99,
      imageUrl: 'https://source.unsplash.com/random/?grapes',
      categoryId: '1',
      aisleId: '2',
      stock: 90,
      unit: 'kg',
      reviews: ['Really sweet.', 'Perfect snack.'],
    ),
    Product(
      id: Uuid().v4(),
      name: 'Tomato',
      description: 'Ripe and juicy tomatoes.',
      price: 0.99,
      discountedPrice: 0.79,
      imageUrl: 'https://source.unsplash.com/random/?tomato',
      categoryId: '2',
      aisleId: '3',
      stock: 200,
      unit: 'kg',
      reviews: ['Great for salads.', 'Very fresh.'],
    ),
    Product(
      id: Uuid().v4(),
      name: 'Broccoli',
      description: 'Fresh and green broccoli.',
      price: 1.29,
      discountedPrice: 1.09,
      imageUrl: 'https://source.unsplash.com/random/?broccoli',
      categoryId: '2',
      aisleId: '3',
      stock: 100,
      unit: 'kg',
      reviews: ['Loved it!', 'Healthy choice.'],
    ),
    Product(
      id: Uuid().v4(),
      name: 'Chicken',
      description: 'Fresh farm chicken.',
      price: 5.99,
      discountedPrice: 4.99,
      imageUrl: 'https://source.unsplash.com/random/?chicken',
      categoryId: '3',
      aisleId: '4',
      stock: 50,
      unit: 'kg',
      reviews: ['Good quality.', 'Tasty when cooked.'],
    ),
    Product(
      id: Uuid().v4(),
      name: 'Salmon',
      description: 'Fresh Atlantic salmon.',
      price: 10.99,
      discountedPrice: 9.99,
      imageUrl: 'https://source.unsplash.com/random/?salmon',
      categoryId: '3',
      aisleId: '4',
      stock: 30,
      unit: 'kg',
      reviews: ['Delicious!', 'Great for grilling.'],
    ),
  ];
}
