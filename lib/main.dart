import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/auth_firebase/login_screen.dart';
import 'package:english_application/widgets/main_screen/drawing_page/drawing_page.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:english_application/widgets/main_screen/words_page.dart';
import 'package:flutter/material.dart';
import 'package:english_application/widgets/authorization/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.mainColorApp
          ), 
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainColorApp,
            selectedItemColor: Colors.yellow.shade50,
            unselectedItemColor: Colors.white54,
          ),
        ),
        routes: { 
          '/auth': (context) => const LoginScreenWidget(),
          '/main_screen': (context) => const MainScreenWidget(),
          '/main_screen/words_page': (context) => const PaintBoard(),
        },
        initialRoute: '/auth',
    );
  }
}
