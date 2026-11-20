import 'package:flutter_application/resource/model/location_model.dart';
import 'package:flutter_application/resource/remote/checkout_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final CheckoutRemoteResource checkoutRemoteResource;

  LocationCubit(this.checkoutRemoteResource)
      : super(const LocationState.initial());

  Future<void> getLocation(String search) async {
    emit(const LocationState.loading());
    final result = await checkoutRemoteResource.getLocation(search);
    result.fold(
      (message) => emit(LocationState.error(message)),
      (location) => emit(LocationState.loaded(location)),
    );
  }

  void clearLocation() {
    emit(const LocationState.initial());
  }
}