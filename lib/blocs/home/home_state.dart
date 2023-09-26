part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Category> categories;
  final List<Product> popularProducts;
  final List<Product> featuresProducts;
  final Product? productOfTheDay;

  const HomeState({
    this.status = HomeStatus.initial,
    this.categories = const [],
    this.popularProducts = const [],
    this.featuresProducts = const [],
    this.productOfTheDay,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Category>? categories,
    List<Product>? popularProducts,
    List<Product>? featuresProducts,
    Product? productOfTheDay,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      popularProducts: popularProducts ?? this.popularProducts,
      featuresProducts: featuresProducts ?? this.featuresProducts,
      productOfTheDay: productOfTheDay ?? this.productOfTheDay,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        popularProducts,
        featuresProducts,
        productOfTheDay,
      ];
}
