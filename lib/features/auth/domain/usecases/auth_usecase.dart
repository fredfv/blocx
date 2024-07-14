import 'package:blocx/core/usecases/usecase.dart';

import '../../../../core/utils/result.dart';
import '../../infra/repositories/auth_repository.dart';
import '../entities/user.dart';
import '../repositories/i_auth_repository.dart';

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});
}

class AuthUsecase implements IUsecase<Result<Exception, User>, LoginRequest> {
  final IAuthRepository repository;

  const AuthUsecase({required this.repository});

  @override
  call(params) async {
    return await repository.login(params.username, params.password);
  }
}
