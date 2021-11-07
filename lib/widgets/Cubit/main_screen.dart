import 'package:english_application/widgets/Cubit/auth_builder.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AuthCubitBuilder(
        buildAuthorizedState: (context) => const _UnAuthorizedPage(), 
        buildNotAuthorizedState: (context) => const _AuthorizedPage(),
        )
    );
  }
}