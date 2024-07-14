import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocx/core/utils/result.dart';
import 'package:blocx/features/auth/domain/application/login_request.dart';
import 'package:blocx/features/auth/domain/entities/user_entity.dart';
import 'package:blocx/features/auth/domain/usecases/logout_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUseCase;
  final LogoutUsecase _logoutUsecase;

  AuthBloc({
    required AuthUsecase authUseCase,
    required LogoutUsecase logoutUsecase,
  })  : _authUseCase = authUseCase,
        _logoutUsecase = logoutUsecase,
        super(const AuthUnauthenticated()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _logoutUsecase(unit).then((result) {
      result.fold(
        (l) => emit(AuthError(l.toString())),
        (r) => emit(const AuthUnauthenticated()),
      );
    });
  }

  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading()); // Emit a loading state before the async operation

    final result = await _authUseCase(event.request);

    result.fold(
      (l) => emit(AuthError(l.toString())),
      (r) => emit(AuthSuccess(r)),
    );
  }
}
