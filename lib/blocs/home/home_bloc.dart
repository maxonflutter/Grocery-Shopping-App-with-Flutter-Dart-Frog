import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  HomeBloc({
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        super(const HomeState()) {
    on<HomeLoadEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final categories = _categoryRepository.getCategories();
      final products = _productRepository.getProducts();
      final results = await Future.wait([categories, products]);

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          popularProducts: results[1] as List<Product>,
          productOfTheDay: results[1].first as Product,
          categories: results[0] as List<Category>,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
