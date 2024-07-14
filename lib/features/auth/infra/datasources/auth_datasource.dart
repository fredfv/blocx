import 'package:blocx/features/auth/domain/application/login_request.dart';
import 'package:blocx/features/auth/infra/repositories/datasources/i_auth_datasource.dart';

import '../../../../core/adapters/http_adapters/http_client_adapter.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user_entity.dart';
import '../repositories/models/user_model.dart';

class AuthDatasource implements IAuthDatasource {
  final IHttpClientAdapter client;

  const AuthDatasource({required this.client});

  @override
  Future<Result<Exception, UserModel>> login(LoginRequest request) async {
    const url = 'http://localhost:5001/api/v1/person/auth';

    try {
      final response = await client.post(url, data: request.toMap);

      if (response.statusCode.isError) {
        return Failure(Exception(response.data?['message'] ?? response.statusCode.message));
      }
      return Success(UserModel.fromMap(response.data));
    } catch (e) {
      return Failure(Exception('Server error'));
    }
  }
}
