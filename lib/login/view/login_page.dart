import 'package:authentication_repository/authentication_repository.dart';
import 'package:english_application/login/login.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenglish'), 
        centerTitle: true,
        backgroundColor: AppColors.mainColorApp,
        ),
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}