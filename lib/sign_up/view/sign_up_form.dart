import 'package:english_application/login/cubit/login_cubit.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english_application/sign_up/sign_up.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        // alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              _NameInput(),
              const SizedBox(height: 8),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _ConfirmPasswordInput(),
              const SizedBox(height: 8),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      // buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          // key: const Key('signUpForm_emailInput_textField'),
          // onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColorApp,
                )),
            labelText: 'Имя',
            helperText: '',
            // errorText: state.email.invalid ? 'Неверный email' : null,
            prefixIcon: const Icon(Icons.person, color: Colors.grey),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          ),
        );
      },
    );
  }
}
class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColorApp,
                )),
            labelText: 'Email',
            helperText: '',
            errorText: state.email.invalid ? 'Неверный email' : null,
            prefixIcon: const Icon(Icons.mail, color: Colors.grey),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColorApp,
                )),
            labelText: 'Пароль',
            helperText: '',
            errorText: state.password.invalid ? 'Неверный пароль' : null,
            prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColorApp,
                )),
            labelText: 'Подтвердите пароль',
            helperText: '',
            errorText: state.confirmedPassword.invalid
                ? 'Пароли не совпадают'
                : null,
            prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
            contentPadding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: AppColors.mainColorApp,
                  elevation: 9,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12, 
                    horizontal: 40,
                  ),
                ),
                onPressed: state.status.isValidated
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                child: const Text(
                  'СОЗДАТЬ АККАУНТ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  ),
              );
      },
    );
  }
}
