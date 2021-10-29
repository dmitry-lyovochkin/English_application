import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameEditingController.text = value!;
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
          prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "First Name",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        secondNameEditingController.text = value!;
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
          prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Second Name",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
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
          )
        ),
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
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
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
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Password",
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
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
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Confirm Password",
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
            "Registration",
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
                          const Text("Have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push<Widget>(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreenWidget()));
                            },
                            child: const Text(
                              "Login",
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
