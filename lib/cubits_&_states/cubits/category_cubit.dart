import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubits_&_states/state/category_state.dart';
import 'package:flutter/material.dart';
import 'package:project1/repo/category_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInit());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await CategoryRepo().getCategories();
      emit(CategorySuccess(categories: categories));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
