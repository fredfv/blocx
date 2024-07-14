import 'package:blocx/features/auth/domain/application/login_request.dart';

import '../../../../../core/utils/result.dart';
import '../models/user_model.dart';

abstract interface class IAuthDatasource {
  Future<Result<Exception, UserModel>> login(LoginRequest request);
}
