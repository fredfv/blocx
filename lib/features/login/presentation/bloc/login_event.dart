part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginSubmitted extends LoginEvent {
  final LoginRequest loginRequest;

  const LoginSubmitted(this.loginRequest);

  @override
  List<Object> get props => [loginRequest];
}

final class AuthStateChanged extends LoginEvent {
  final AuthState authState;

  const AuthStateChanged(this.authState);

  @override
  List<Object> get props => [authState];
}
