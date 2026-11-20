import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/resource/local/auth_local_resource.dart';
import 'package:flutter_application/resource/remote/auth_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteResource authRemoteResource;

  AuthBloc(this.authRemoteResource) : super(const Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (email, password) async {
          emit(const AuthState.loading());
          final result = await authRemoteResource.login(email, password);
          await result.fold(
            (error) async {
              emit(AuthState.failure(error: error));
            },
            (response) async {
              if (response.token != null) {
                await AuthLocalResource.saveToken(response.token!);
              }
              emit(const AuthState.authenticated());
            },
          );
        },
        registerRequested:
            (name, email, password, passwordConfirmation) async {
          emit(const AuthState.loading());
          final result = await authRemoteResource.register(
            name,
            email,
            password,
            passwordConfirmation,
          );
          result.fold(
            (error) => emit(AuthState.registerFailure(error: error)),
            (message) => emit(AuthState.registerSuccess(message: message)),
          );
        },
        logoutRequested: () async {
          await authRemoteResource.logout();
          emit(const AuthState.unauthenticated());
        },
        checkLoginStatus: () async {
          final token = await AuthLocalResource.getToken();
          if (token != null) {
            emit(const AuthState.authenticated());
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
      );
    });
  }
}