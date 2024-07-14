import 'package:blocx/core/usecases/usecase.dart';

import '../../../../core/utils/result.dart';
import '../repositories/i_auth_repository.dart';

class LogoutUsecase implements IUsecase<Result<Exception, bool>, NoParams> {
  final IAuthRepository repository;

  const LogoutUsecase({required this.repository});

  @override
  call(params) async {
    return await repository.logout();
  }
}
