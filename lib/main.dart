import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home/home_bloc.dart';
import 'navigator/app_router.dart';
import 'repositories/category_repository.dart';
import 'repositories/product_repository.dart';
import 'services/api_client.dart';

void main() {
  final ApiClient apiClient = ApiClient();
  final CategoryRepository categoryRepository =
      CategoryRepository(apiClient: apiClient);

  final ProductRepository productRepository =
      ProductRepository(apiClient: apiClient);

  runApp(MyApp(
    categoryRepository: categoryRepository,
    productRepository: productRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.categoryRepository,
    required this.productRepository,
  });

  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryRepository),
        RepositoryProvider.value(value: productRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              categoryRepository: context.read<CategoryRepository>(),
              productRepository: context.read<ProductRepository>(),
            )..add(const HomeLoadEvent()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
