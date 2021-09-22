import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Профиль',
    ),
    Text(
      'Повторение',
    ),
    Text(
      'Слова',
    ),
    Text(
      'Предложения',
    ),
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
        title: Text('Tenglish'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        // backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Профиль'),
          BottomNavigationBarItem(
              icon: Icon(Icons.replay_rounded), label: 'Повторение'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Слова'),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension_sharp), label: 'Предложения'),
        ],
        currentIndex: _selectedIndex,
        onTap: onSelectTub,
      ),
    );
  }
}
