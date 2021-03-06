import 'package:english_application/app/app.dart';
import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/drawing_page/drawing_page.dart';
import 'package:english_application/widgets/main_screen/profile_page/profile_page.dart';
import 'package:english_application/widgets/main_screen/words_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  Widget getBody() {
    if (selectedIndex == 0) {
      return const ProfilePageWidget();
    } else {
      return const MyApp();
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onSelectTub(int index) {
    if (index != 2) {
      setState(() {
        selectedIndex = index;
      });
    } else {
      Navigator.push<Widget>(
              context,
              MaterialPageRoute(builder: (context) => const DrawingPage()),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tenglish'),
        backgroundColor: AppColors.mainColorApp,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
        body:  getBody(), 
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: AppColors.mainColorApp,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        selectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '??????????????'),
          BottomNavigationBarItem(icon: Icon(Icons.replay_rounded), label: '????????????????????'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded),label: '??????????'),
          
        ],
        currentIndex: selectedIndex,
        onTap: onSelectTub,
      ),
    );
  }
}
