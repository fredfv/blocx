import 'package:blocx/core/usecases/usecase.dart';

import '../../../../core/utils/result.dart';
import '../application/login_request.dart';
import '../entities/user_entity.dart';
import '../repositories/i_auth_repository.dart';

class AuthUsecase implements IUsecase<Result<Exception, UserEntity>, LoginRequest> {
  final IAuthRepository repository;

  const AuthUsecase({required this.repository});

  @override
  call(params) async {
    return await repository.login(params);
  }
}
