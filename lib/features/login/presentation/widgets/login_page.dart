import 'package:blocx/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blocx/features/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
