import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/blocs/home/home_bloc.dart';
import 'package:grocery_shopping_app/navigator/app_router.dart';
import 'package:grocery_shopping_app/services/api_client.dart';

import 'repositories/category_repository.dart';

void main() {
  final ApiClient apiClient = ApiClient();
  final CategoryRepository categoryRepository =
      CategoryRepository(apiClient: apiClient);

  runApp(MyApp(
    categoryRepository: categoryRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              categoryRepository: context.read<CategoryRepository>(),
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
