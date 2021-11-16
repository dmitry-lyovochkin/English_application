import 'package:english_application/application/auth/auth_cubit.dart';
import 'package:english_application/presentation/forms/login_form.dart';
import 'package:english_application/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.isSignedIn) {
            return const HomePage();
          } else {
            return const LoginForm();
          }
        },
      ),
    );
  }
}