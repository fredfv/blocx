import 'package:blocx/features/auth/domain/application/login_request.dart';
import 'package:blocx/features/auth/infra/repositories/datasources/i_auth_datasource.dart';

import '../../../../core/adapters/infra/mappers/mapper.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import 'models/user_model.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource dataSource;
  final Mapper<UserEntity, UserModel> mapper;

  const AuthRepository({required this.dataSource, required this.mapper});

  @override
  Future<Result<Exception, UserEntity>> login(LoginRequest request) async {
    final result = await dataSource.login(request);
    return result.fold(
      (l) => Failure(l),
      (r) => Success(mapper.toEntity(r)),
    );
  }

  @override
  Future<Result<Exception, bool>> logout() async {
    final result = await Future.delayed(const Duration(seconds: 1));

    return const Success(true);
  }
}
