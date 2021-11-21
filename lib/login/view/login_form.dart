import 'package:english_application/login/login.dart';
import 'package:english_application/sign_up/sign_up.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
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
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 8),
              _SignUpButton(),
              const SizedBox(height: 8),
              _GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
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
            ));
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: AppColors.mainColorApp,
                  elevation: 9,
                  // minWidth: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12, 
                    horizontal: 90
                  ),
                ),
                onPressed: state.status.isValidated
                    ? () => context.read<LoginCubit>().logInWithCredentials()
                    : null,
                child: const Text(
                  'ВХОД', 
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

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('loginForm_googleLogin_raisedButton'),
      child: Column(
        children: <Widget>[
          SignInButton(
            Buttons.Google,
            elevation: 9,
            onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
          ),
          SignInButton(
            Buttons.Twitter,
            elevation: 9,
            text: 'Sign in with Twitter',
            onPressed: () {
              
            },
          ),
          SignInButton(
            Buttons.FacebookNew,
            elevation: 9,
            onPressed: () {
            },
          ),
        ],
      ),

      
    );
    // final theme = Theme.of(context);
    // return ElevatedButton.icon(
    //   key: const Key('loginForm_googleLogin_raisedButton'),
    //   label: const Text(
    //     'SIGN IN WITH GOOGLE',
    //     style: TextStyle(color: Colors.grey),
    //   ),
    //   style: ElevatedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30),
    //     ),
    //     primary: Colors.white,
    //     elevation: 9,
    //   ),
    //   icon: const Icon(FontAwesomeIcons.google, color: Colors.grey),
    //   onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    // );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('loginForm_createAccount_flatButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        primary: AppColors.mainColorApp,
        elevation: 9,
        // minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 12, 
          horizontal: 20
        ),
      ),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: const Text(
        'СОЗДАТЬ АККАУНТ           ', /* Колхоз. Позже поправить */
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
    //   key: const Key('loginForm_createAccount_flatButton'),
    //   onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
    //   child: const Text(
    //     'СОЗДАТЬ АККАУНТ',
    //     style: TextStyle(
    //       color: AppColors.mainColorApp,
    //       fontSize: 16
    //       ),
    //   ),
    // );
  }
}
