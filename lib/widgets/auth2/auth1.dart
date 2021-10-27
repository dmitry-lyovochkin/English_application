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
              TextFormField(controller: emailController, validator: validateEmail),
              TextField(controller: passwordController, obscureText: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        setState(() {});
                      }),
                  ElevatedButton(
                      child: const Text('Sign In'),
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          setState(() {});
                        }
                      }),
                  ElevatedButton(
                      child: const Text('Log Out'),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        setState(() {});
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
  return null;
}
