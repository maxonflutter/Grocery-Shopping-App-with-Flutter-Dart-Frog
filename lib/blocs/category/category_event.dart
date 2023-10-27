part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoadEvent extends CategoryEvent {
  final String categoryId;

  const CategoryLoadEvent({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
