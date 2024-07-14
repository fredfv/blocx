part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => ['LoginInitial'];
}

final class LoginLoading extends LoginState {
  const LoginLoading();

  @override
  List<Object> get props => ['LoginLoading'];
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();

  @override
  List<Object> get props => ['LoginSuccess'];
}

final class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);

  @override
  List<Object> get props => [message];
}
