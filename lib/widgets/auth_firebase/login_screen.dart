import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/registration_screen.dart';
import 'package:english_application/widgets/auth_firebase/validation.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
              )),
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
      validator: (value) {
        RegExp regexp = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[(!@#\$&*~)]).{6,}$'); /* добавил символы ( ) и 6 знаков*/
        if (value!.isEmpty) {
          return "Введите пароль";
        }
        if (!regexp.hasMatch(value)) {
          return ("Пароль должен быть не менее 6 символов. Одна заглавная буква, число и символ(Пример: Vignesh123!)");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
      errorMaxLines: 3,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.7,
                color: AppColors.mainColorApp,
              )),
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
// g123GH456)
    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColorApp,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            if (_key.currentState!.validate()) {
              _signIn();
            }
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
    return GestureDetector( /* Обернул Scaffold в GestureDetector, чтоб скрывать клавиатуру по клику на пустое место */
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
                                  Navigator.push<Widget>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationWidget()));
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
            )),
          ),
    );
  }

  // Firebase Логика Вход
  void _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      setState(() {
        Fluttertoast.showToast(msg: "Успешная авторизация");
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(builder: (context) => const MainScreenWidget()),
        );
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}

// вроде все окей. Но нужно будет переписать с архитектурой. 
// + нужно отслеживать вход пользователя, чтоб показывать ему разные экраны(не вход и регистрацию, если авторизирован). Делается через Bloc Cuibit
// еще нужно будет добавить обработку ошибок с firebase. Неверный пароль, почта уже используется и тому подобные ошибки 
// не работает переход по стрелке клавиатуры на следующее поле при вводе email
// Крашится, если такой емаил уже используется и пользователь создан