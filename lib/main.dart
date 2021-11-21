
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:english_application/app/app.dart';
import 'package:english_application/home/view/home_page.dart';
import 'package:english_application/login/view/login_page.dart';
import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/words_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(App (authenticationRepository: authenticationRepository));
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           appBarTheme: const AppBarTheme(
//               backgroundColor: AppColors.mainColorApp
//           ), 
//           bottomNavigationBarTheme: BottomNavigationBarThemeData(
//             backgroundColor: AppColors.mainColorApp,
//             selectedItemColor: Colors.yellow.shade50,
//             unselectedItemColor: Colors.white54,
//           ),
//         ),
//         initialRoute: '/auth',
//         routes: { /* docs routes */ /* прописывание маршрутов */
//           '/auth': (context) => const LoginPage(),
//           '/main_screen': (context) => const HomePage(),
//           '/main_screen/words_page': (context) => const PaintBoard(),
//         },
//     );
//   }
// }
