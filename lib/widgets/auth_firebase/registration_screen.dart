import 'dart:math';

import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/login_screen.dart';
import 'package:english_application/widgets/auth_firebase/validation.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: _firstNameController,
      keyboardType: TextInputType.name,
      validator: validateFirstName,
      onSaved: (value) {
        _firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.7,
                color: AppColors.mainColorApp,
              )),
          prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Имя",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final secondNameField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: _secondNameController,
      keyboardType: TextInputType.name,
      validator: validateSecondName,
      onSaved: (value) {
        _secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.7,
                color: AppColors.mainColorApp,
              )),
          prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Фамилия",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final emailField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        _emailController.text = value!;
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: _passwordController,
      obscureText: true,
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
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
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.7,
                color: AppColors.mainColorApp,
              )),
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Пароль",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final confirmPasswordField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: _confirmPasswordController,
      obscureText: true,
      onSaved: (value) {
        _confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (_confirmPasswordController.text.length > 6 &&
            _passwordController.text != value) {
          return "Пароли не совпадают";
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.7,
                color: AppColors.mainColorApp,
              )),
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Подтвердите пароль",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final registrationButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColorApp,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            "Регистрация",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(
            height: 20,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: AppColors.mainColorApp,
                ),
                onPressed: ()  async {
                      if (_formKey.currentState!.validate()) {
                          registration();
                      }
                      
                    })
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              /* обернул в padding, чтоб все три поля уравнять по центру с одинаковыми отступами */
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      firstNameField,
                      const SizedBox(height: 10),
                      secondNameField,
                      const SizedBox(height: 10),
                      emailField,
                      const SizedBox(height: 10),
                      passwordField,
                      const SizedBox(height: 10),
                      confirmPasswordField,
                      const SizedBox(height: 20),
                      registrationButton,
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Есть аккаунт? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push<Widget>(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreenWidget()));
                            },
                            child: const Text(
                              "Вход",
                              style: TextStyle(
                                color: AppColors.mainColorApp,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        )));
  }

  @override
  void dispose()  {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

   void registration()async{
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmpassword = _confirmPasswordController.text.trim();
    if(password == confirmpassword) {
      try {
        final User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password)).user;
        setState(() {
          if (user != null) {
            Fluttertoast.showToast(msg: "Пользователь создан");
            Navigator.push<Widget>(context, MaterialPageRoute(builder: (context) => const MainScreenWidget()),);
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
    else{
      Fluttertoast.showToast(msg: "Passwords don't match");
    }
   }

// Сделать, чтоб по нажатию на пустое поле скрывалась клавиатура

}
