import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  CategoryBloc({
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        super(const CategoryState()) {
    on<CategoryLoadEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(
    CategoryLoadEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final categories = _categoryRepository.getCategoryById(event.categoryId);
      final products = _productRepository.getProductsByCategoryId(
        event.categoryId,
      );

      final results = await Future.wait([categories, products]);

      emit(
        state.copyWith(
          status: CategoryStatus.loaded,
          category: results[0] as Category,
          categoryProducts: results[1] as List<Product>,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }
}
