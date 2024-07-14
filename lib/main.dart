import 'package:blocx/features/auth/infra/datasources/auth_datasource.dart';
import 'package:blocx/features/auth/infra/mappers/user_mapper.dart';
import 'package:blocx/features/auth/infra/repositories/datasources/i_auth_datasource.dart';
import 'package:blocx/features/splash/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/adapters/http_adapters/dio/dio_adapter.dart';
import 'core/adapters/http_adapters/http_client_adapter.dart';
import 'features/auth/domain/repositories/i_auth_repository.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/infra/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

GetIt getIt = GetIt.instance;

void main() async {
  getIt.registerSingleton<IHttpClientAdapter>(DioAdapter(dio: Dio()));
  getIt.registerSingleton<IAuthDatasource>(AuthDatasource(client: getIt.get<IHttpClientAdapter>()));
  getIt.registerSingleton<IAuthRepository>(AuthRepository(dataSource: getIt.get<IAuthDatasource>(), mapper: UserMapper()));
  getIt.registerSingleton<AuthUsecase>(AuthUsecase(repository: getIt.get<IAuthRepository>()));

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(authUseCase: getIt.get<AuthUsecase>()),
      lazy: false,
      child: const SplashScreen(),
    ),
  );
}
