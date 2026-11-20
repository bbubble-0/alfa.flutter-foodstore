import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_bloc.freezed.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.fetchCategories() = _FetchCategories;
}

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.loaded(List<dynamic> categories) = _Loaded;
  const factory CategoryState.error(String message) = _Error;
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState.initial()) {
    on<_FetchCategories>((event, emit) async {
      emit(const CategoryState.loading());
      try {
        emit(const CategoryState.loaded([]));
      } catch (e) {
        emit(CategoryState.error(e.toString()));
      }
    });
  }
}