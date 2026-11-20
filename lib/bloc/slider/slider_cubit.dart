import 'package:flutter_application/bloc/slider/slider_state.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<SliderState> {
  final HomeRemoteResource homeRemoteResource;

  SliderCubit(this.homeRemoteResource) : super(SliderInitial());

  Future<void> fetchSliders() async {
    emit(SliderLoading());
    final result = await homeRemoteResource.fetchSliders();
    result.fold(
      (error) => emit(SliderError(error)),
      (sliders) => emit(SliderLoaded(sliders)),
    );
  }
}