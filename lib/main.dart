import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/main_screen/gfe.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_application/widgets/authorization/auth_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        routes: { /* docs routes */ /* прописывание маршрутов */
          '/auth': (context) => AuthWidget(),
          '/main_screen': (context) => MainScreenWidget(),
        },
        initialRoute: '/auth',
        // onGenerateRoute: (RouteSettings settings) { /* очень крутая штука, почитать */
        //   return MaterialPageRoute<void>(builder: (context) { /* можно делать анимации и много возможностей */
        //     return Scaffold(
        //       body: Center(
        //         child: Text('Произошла ошибка навигации'),
        //       ),
        //     );
        //   });
        // }
    );
  }
}
