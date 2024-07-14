import 'package:blocx/core/utils/result.dart';
import '../entities/user.dart';

abstract class IAuthRepository {
  Future<Result<Exception, User>> login(String username, String password);
  Future<Result<Exception, User>> logout();
}
