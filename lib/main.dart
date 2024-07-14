import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/adapters/http_adapters/dio/dio_adapter.dart';
import 'core/adapters/http_adapters/http_client_adapter.dart';
import 'features/auth/domain/repositories/i_auth_repository.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/infra/repositories/auth_repository.dart';
import 'features/auth/infra/repositories/models/user_mapper.dart';

GetIt getIt = GetIt.instance;

void main() async {
  getIt.registerSingleton<IHttpClientAdapter>(DioAdapter(dio: Dio()));
  getIt.registerSingleton<IAuthRepository>(AuthRepository(client: getIt.get<IHttpClientAdapter>(), mapper: UserMapperV1()));
  getIt.registerSingleton<AuthUsecase>(AuthUsecase(repository: getIt.get<IAuthRepository>()));

  //runApp(const MyApp());
}
