import 'package:meta/meta.dart';

@sealed
abstract class Result<F extends Object, S extends Object> {
  factory Result.success(S s) => Success(s);

  factory Result.failure(F e) => Failure(e);

  S getOrThrow();

  S getOrElse(S Function(F failure) onFailure);

  S getOrDefault(S defaultValue);

  S? getOrNull();

  F? exceptionOrNull();

  bool isError();

  bool isSuccess();

  W fold<W>(
    W Function(S success) onSuccess,
    W Function(F failure) onFailure,
  );
}

@immutable
class Success<F extends Object, S extends Object> implements Result<F, S> {
  const Success(
    this._success,
  );

  static Success<F, NoParams> unit2<F extends Object>() {
    return Success<F, NoParams>(unit);
  }

  final S _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Success && other._success == _success;
  }

  @override
  W fold<W>(
    W Function(S success) onSuccess,
    W Function(F error) onFailure,
  ) {
    return onSuccess(_success);
  }

  @override
  F? exceptionOrNull() => null;

  @override
  S getOrNull() => _success;

  @override
  S getOrThrow() {
    return _success;
  }

  @override
  S getOrElse(S Function(F failure) onFailure) {
    return _success;
  }

  @override
  S getOrDefault(S defaultValue) => _success;
}

@immutable
class Failure<F extends Object, S extends Object> implements Result<F, S> {
  const Failure(this._failure);

  static Failure<NoParams, S> unit<S extends Object>() {
    return Failure<NoParams, S>(const NoParams._());
  }

  final F _failure;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _failure.hashCode;

  @override
  bool operator ==(Object other) => //
      other is Failure && other._failure == _failure;

  @override
  W fold<W>(
    W Function(S succcess) onSuccess,
    W Function(F failure) onFailure,
  ) {
    return onFailure(_failure);
  }

  @override
  F exceptionOrNull() => _failure;

  @override
  S? getOrNull() => null;

  @override
  S getOrThrow() {
    throw _failure;
  }

  @override
  S getOrElse(S Function(F failure) onFailure) {
    return onFailure(_failure);
  }

  @override
  S getOrDefault(S defaultValue) => defaultValue;
}

@sealed
class NoParams {
  const NoParams._();
}

const unit = NoParams._();
