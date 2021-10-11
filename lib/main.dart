import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:english_application/widgets/main_screen/words_page.dart';
import 'package:english_application/widgets/words_screen/paint_screen_widget.dart';
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
        title: 'English words',
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
        initialRoute: '/auth',
        routes: { /* docs routes */ /* прописывание маршрутов */
          '/auth': (context) => const AuthWidget(),
          '/main_screen': (context) => const MainScreenWidget(),
          '/main_screen/words_page': (context) =>  const PaintBoard(),
        },
    );
  }
}
