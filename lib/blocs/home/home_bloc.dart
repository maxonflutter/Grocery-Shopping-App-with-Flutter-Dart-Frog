import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

import '../../repositories/category_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepository;

  HomeBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(const HomeState()) {
    on<HomeLoadEvent>(_onLoadEvent);
  }

  Future<void> _onLoadEvent(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final categories = await _categoryRepository.getCategories();
      // final popularProducts = await _categoryRepository.getPopularProducts();
      // final featuresProducts = await _categoryRepository.getFeaturesProducts();
      // final productOfTheDay =
      //     await _categoryRepository.getProductOfTheDay();

      emit(state.copyWith(
        status: HomeStatus.loaded,
        categories: categories,
        // popularProducts: popularProducts,
        // featuresProducts: featuresProducts,
        // productOfTheDay: productOfTheDay,
      ));
    } catch (err) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
