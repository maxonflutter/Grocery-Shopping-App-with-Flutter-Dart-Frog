part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Category> popularCategories;
  final List<Product> popularProducts;
  final List<Product> featuredProducts;
  final Product? productOfTheDay;

  const HomeState({
    this.status = HomeStatus.initial,
    this.popularCategories = const [],
    this.popularProducts = const [],
    this.featuredProducts = const [],
    this.productOfTheDay,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Category>? popularCategories,
    List<Product>? popularProducts,
    List<Product>? featuredProducts,
    Product? productOfTheDay,
  }) {
    return HomeState(
      status: status ?? this.status,
      popularCategories: popularCategories ?? this.popularCategories,
      popularProducts: popularProducts ?? this.popularProducts,
      featuredProducts: featuredProducts ?? this.featuredProducts,
      productOfTheDay: productOfTheDay ?? this.productOfTheDay,
    );
  }

  @override
  List<Object?> get props => [
        status,
        popularCategories,
        popularProducts,
        featuredProducts,
        productOfTheDay,
      ];
}
