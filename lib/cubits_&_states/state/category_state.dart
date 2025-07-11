import 'package:project1/models/category_model.dart';

abstract class CategoryState {}

class CategoryInit extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  CategorySuccess({required this.categories});
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({
    required this.error,
  });
}
