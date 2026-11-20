import 'package:flutter_application/bloc/category/category_state.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRemoteResource homeRemoteResource;

  CategoryCubit(this.homeRemoteResource) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    final result = await homeRemoteResource.fetchCategories();
    result.fold(
      (error) => emit(CategoryError(error)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}