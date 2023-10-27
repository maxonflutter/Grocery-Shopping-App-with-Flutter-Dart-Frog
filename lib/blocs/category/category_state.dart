part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, loaded, error }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final Category? category;
  final List<Product> categoryProducts;

  const CategoryState({
    this.status = CategoryStatus.initial,
    this.category,
    this.categoryProducts = const [],
  });

  CategoryState copyWith({
    CategoryStatus? status,
    Category? category,
    List<Product>? categoryProducts,
  }) {
    return CategoryState(
      status: status ?? this.status,
      category: category ?? this.category,
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }

  @override
  List<Object?> get props => [status, category, categoryProducts];
}
