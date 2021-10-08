import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:english_application/widgets/main_screen/profile_page.dart';
import 'package:english_application/widgets/main_screen/repeat_page.dart';
import 'package:english_application/widgets/main_screen/suggestions_page.dart';
import 'package:english_application/widgets/main_screen/words_page.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 2;
  final screens = [
    const ProfilePageWidget(),
    RepeatPageWidget(),
    WordsPageWidget(),
    SuggestionsPageWidget(),
  ];

  void onSelectTub(int index) {
    if (_selectedIndex == index) return; /* если индекс уже равен выделенной вкладке, то по сути ничего не делаем. Так стейт не обновляем, если вкладка уже выбрана */
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tenglish'),
      ),
      body: screens [_selectedIndex],
      bottomNavigationBar:  BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: AppColors.mainColorApp,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        selectedFontSize: 15,
        onTap: onSelectTub,
        currentIndex: _selectedIndex,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Профиль'),
          BottomNavigationBarItem(
              icon: Icon(Icons.replay_rounded), label: 'Повторение'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Слова'),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension_sharp), label: 'Предложения'),
        ],
      ),
    );
  }
}
