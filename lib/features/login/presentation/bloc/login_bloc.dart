import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocx/features/auth/domain/application/login_request.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc _authBloc;
  late final StreamSubscription _authBlocSubscription;

  LoginBloc({required AuthBloc authBloc})
      : _authBloc = authBloc,
        super(const LoginInitial()) {
    on<LoginSubmitted>(_onSubmitted);
    on<AuthStateChanged>(_onAuthStateChanged);

    _authBlocSubscription = _authBloc.stream.listen((authState) {
      add(AuthStateChanged(authState));
    });
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) {
    _authBloc.add(AuthLoginRequested(event.loginRequest));
  }

  void _onAuthStateChanged(
    AuthStateChanged event,
    Emitter<LoginState> emit,
  ) {
    final authState = event.authState;

    if (authState is AuthLoading) {
      emit(const LoginLoading());
    } else if (authState is AuthSuccess) {
      emit(const LoginSuccess());
    } else if (authState is AuthUnauthenticated) {
      emit(const LoginFailure('Authentication Failed'));
    } else if (authState is AuthError) {
      emit(LoginFailure(authState.message));
    }
  }

  @override
  Future<void> close() {
    _authBlocSubscription.cancel();
    return super.close();
  }
}
