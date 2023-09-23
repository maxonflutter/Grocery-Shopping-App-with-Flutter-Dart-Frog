import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] ?? Uuid().v4(),
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        imageUrl:
            json['imageUrl'] ?? 'https://source.unsplash.com/random/?category',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
      };

  static List<Category> sampleData = [
    Category(
      id: Uuid().v4(),
      name: 'Fruits',
      description: 'A category for all kinds of fruits.',
      imageUrl: 'https://source.unsplash.com/random/?fruit',
    ),
    Category(
      id: Uuid().v4(),
      name: 'Vegetables',
      description: 'A category for all kinds of vegetables.',
      imageUrl: 'https://source.unsplash.com/random/?vegetable',
    ),
    // Add more sample data as needed
  ];
}
