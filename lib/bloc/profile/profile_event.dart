part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = LoadProfile;

  const factory ProfileEvent.updateProfile({
    required String name,
    required String email,
    File? image,
    String? password,
    String? passwordConfirmation,
  }) = UpdateProfile;
}