import 'package:blocx/core/adapters/http_adapters/http_client_adapter.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repository.dart';
import 'models/user_mapper.dart';

class AuthRepository implements IAuthRepository {
  final IHttpClientAdapter client;
  final Mapper<User> mapper;

  const AuthRepository({required this.client, required this.mapper});

  @override
  Future<Result<Exception, User>> login(String username, String password) async {
    const url = 'http://localhost:5001/api/v1/person/auth';

    try {
      final response = await client.post(url, data: {'username': username, 'password': password});

      if (response.statusCode.isError) {
        return Failure(Exception(response.data?['message'] ?? response.statusCode.message));
      }
      return Success(mapper.fromAPI(response.data));
    } catch (e) {
      return Failure(Exception('Server error'));
    }
  }

  @override
  Future<Result<Exception, User>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
