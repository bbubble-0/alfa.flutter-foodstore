part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadedProfile(CustomerModel profile) =
      LoadedProfile;
  const factory ProfileState.updatedProfile(String message) = UpdatedProfile;
  const factory ProfileState.failure({required Map<String, dynamic> error}) =
      Failure;
}