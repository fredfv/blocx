import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/widgets/home_page.dart';
import 'features/login/presentation/widgets/login_page.dart';
import 'features/splash/presentation/splash_page.dart';
import 'main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AuthBloc(
              authUseCase: getIt.get<AuthUsecase>(),
              logoutUsecase: getIt.get<LogoutUsecase>(),
            ),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashPage(),
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
          },
        ));
  }
}
