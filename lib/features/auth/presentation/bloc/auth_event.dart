part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginRequested extends AuthEvent {
  final LoginRequest request;
  const AuthLoginRequested(this.request);
}

final class AuthLogoutRequested extends AuthEvent {}
