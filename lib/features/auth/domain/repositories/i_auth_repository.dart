import 'package:blocx/core/utils/result.dart';
import 'package:blocx/features/auth/domain/application/login_request.dart';
import '../entities/user_entity.dart';

abstract interface class IAuthRepository {
  Future<Result<Exception, UserEntity>> login(LoginRequest request);
  Future<Result<Exception, bool>> logout();
}
