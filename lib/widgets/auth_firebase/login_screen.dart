import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/registration_screen.dart';
import 'package:english_application/widgets/auth_firebase/validation.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // firebase
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
  
    final emailField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1.7,
            color: AppColors.mainColorApp,
          )
        ),
          prefixIcon: const Icon(Icons.mail, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Email",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          // hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          )),
    );

    final passwordField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: passwordController,
      obscureText: true, /* скроет пароль */

      validator: validatePassword,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.7,
              color: AppColors.mainColorApp,
            )
          ),
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
          labelText: "Пароль",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          
          // hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColorApp,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Вход",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              /* обернул в padding, чтоб все три поля уравнять по центру с одинаковыми отступами */
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      emailField,
                      const SizedBox(height: 10),
                      passwordField,
                      const SizedBox(height: 20),
                      loginButton,
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Нет аккаунта? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push<Widget>(context, MaterialPageRoute(builder: (context) =>const RegistrationWidget()));
                            },
                            child: const Text("Регистрация",
                                style: TextStyle(
                                  color: AppColors.mainColorApp,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        )));
  }

  // login
  void signIn(String email, String password) async {
    if (_key.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute<Widget>(builder: (context) => const MainScreenWidget())),
              }
          );
        //   .catchError((e) {
        // Fluttertoast.showToast(msg: e!.message);
      }
    }
  }



