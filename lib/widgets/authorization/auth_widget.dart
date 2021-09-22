import 'package:english_application/widgets/Theme/app_button_style.dart';
import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Forgot?'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin'); /* уйдут в Textfield - controller */
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;
  void _login() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushNamed('/main_screen'); /* pushNamed, pushReplacementNamed */

    } else {
      errorText = 'Wrong login or password!';
      print('show error');
    }
    setState(() {});
  }

  void _signUp() {
    print('Sign Up');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black45,    
    );
    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(
              fontSize: 17,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20),
        ],
        Text(
          'Username',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 20),
        Text(
          'Password',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
                onPressed: _login,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.mainColorApp),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                ),
                child: Text('Login')),
            SizedBox(width: 20),
            TextButton(
                onPressed: _signUp,
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(AppColors.mainColorApp),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                child: Text('Sign Up')),
          ],
        ),
      ],
    );
  }
}
