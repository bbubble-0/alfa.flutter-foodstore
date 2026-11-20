import 'package:flutter_application/resource/model/slider_model.dart';

abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderLoaded extends SliderState {
  final List<SliderModel> sliders;

  SliderLoaded(this.sliders);
}

class SliderError extends SliderState {
  final String message;

  SliderError(this.message);
}