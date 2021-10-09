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
  int selectedIndex = 0;
  // Widget _ProfilePageWidget = ProfilePageWidget();
  // Widget _RepeatPageWidget = RepeatPageWidget();
  // Widget _SuggestionsPageWidget = SuggestionsPageWidget();
  
  // final screens = [
  //   const ProfilePageWidget(),
  //   RepeatPageWidget(),
  //   const WordsPageWidget(),
  //   SuggestionsPageWidget(),
  // ];

  Widget getBody() {
    if (selectedIndex == 0) {
      return ProfilePageWidget();
    } else if (selectedIndex == 1) {
      return RepeatPageWidget();
    } else if (selectedIndex == 2) {
      return PaintBoard(); /* пофиксить потом, 2 раза прописываю */
    } else {
      return SuggestionsPageWidget();
    }
  }

  // void _onSelectTub(int index) {
  //   Navigator.of(context).pushNamed('/paint_screen');
  // }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // IndexedStack(
  //   index: selectedIndex,
  //   children: [
  //     WordsPageWidget(),
  //   ],
  // )
  void onSelectTub(int index) {
    if (index != 2) {
      setState(() {
        selectedIndex = index;
      });
    } else {
      Navigator.of(context).pushNamed('/main_screen/words_page');
    }
  }

  /* .of(context, rootNavigator: true) убирает бар */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tenglish'),
      ),
      // body: screens[_selectedIndex],
      body:  getBody(), 
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: AppColors.mainColorApp,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        selectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          BottomNavigationBarItem(icon: Icon(Icons.replay_rounded), label: 'Повторение'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded),label: 'Слова'),
          BottomNavigationBarItem(icon: Icon(Icons.extension_sharp), label: 'Предложения'),
          
        ],
        onTap: (int index) {
          onSelectTub(index);
        },
        currentIndex: selectedIndex,
      ),
    );
  }
}
