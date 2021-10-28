import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthApp extends StatefulWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  /* for validation */
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: /* тернарный оператор, показ в аппбар авторизован ли пользователь проверка */
              Text('Auth User (Logged' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Form(
          /* обернул в form для вал. */
          key: _key,
          child: Center(
            child: Column(children: [
              TextFormField(
                  controller: emailController, validator: validateEmail),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: validatePassword),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(errorMessage, style: TextStyle(color: Colors.red)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Sign Up'),
                      onPressed: user != null
                          ? null
                          : () async {
                              setState(() {
                                isLoading = true;
                                errorMessage = '';
                              });
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              }
                            }),
                  ElevatedButton(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Sign In'),
                      onPressed: user != null
                          ? null
                          : () async {
                              setState(() => isLoading = true);
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  errorMessage = '';
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              }
                            }),
                  ElevatedButton(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Log Out'),
                      onPressed: user == null
                          ? null
                          : () async {
                              setState(() => isLoading = true);
                              try {
                                await FirebaseAuth.instance.signOut();
                                errorMessage = '';
                              } on FirebaseAuthException catch (error) {
                                errorMessage = error.message!;
                              }
                              setState(() => isLoading = false);
                            }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Email adress is required";
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return "Invalid Email adress format";
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Password is required";
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return "Password must be at least 8 characters, include an uppercase letter, number and symbol";
  }

  return null;
}
