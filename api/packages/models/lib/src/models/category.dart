import 'package:equatable/equatable.dart';

enum CategorySortBy {
  lowToHighPrice(
    'Lowest Price',
    //  Icons.arrow_downward_outlined,
  ),
  highToLowPrice(
    'Highest Price',
    // Icons.arrow_upward_outlined
  );

  const CategorySortBy(
    this.label,

    // this.icon,
  );
  final String label;
  // final IconData icon;
}

enum CategoryPreferences {
  vegan('Vegan'),
  organic('Organic'),
  glutenFree('Gluten Free');

  const CategoryPreferences(this.label);

  final String label;
}

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;

  const Category({
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

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  static List<Category> sampleData = [
    Category(
      id: '1',
      name: 'Fruits',
      description: 'Fresh fruits',
      imageUrl: 'https://source.unsplash.com/random/?fruit',
    ),
    Category(
      id: '2',
      name: 'Vegetables',
      description: 'Fresh vegetables',
      imageUrl: 'https://source.unsplash.com/random/?vegetable',
    ),
    Category(
      id: '3',
      name: 'Dairy',
      description: 'Dairy products',
      imageUrl: 'https://source.unsplash.com/random/?dairy',
    ),
  ];
}
