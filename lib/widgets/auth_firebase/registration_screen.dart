import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/login_screen.dart';
import 'package:english_application/widgets/auth_firebase/validation.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      cursorColor: AppColors.mainColorApp,
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: validateFirstName,
      onSaved: (value) {
        firstNameController.text = value!;
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
      controller: secondNameController,
      keyboardType: TextInputType.name,
      validator: validateSecondName,
      onSaved: (value) {
        secondNameController.text = value!;
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
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        emailEditingController.text = value!;
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
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
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
      controller: confirmPasswordController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (confirmPasswordController.text.length > 6 && passwordController.text != value) {
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
                onPressed: () {
                  Navigator.of(context).pop();
                }),
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
}

// Сделать, чтоб по нажатию скрывалась клавиатура