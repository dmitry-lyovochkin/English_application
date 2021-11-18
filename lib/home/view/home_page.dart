import 'package:english_application/app/app.dart';
import 'package:english_application/home/home.dart';
import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/profile_page/profile_page.dart';
import 'package:english_application/widgets/main_screen/repeat_page/repeat_page.dart';
import 'package:english_application/widgets/main_screen/suggestion_page/suggestions_page.dart';
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
  int _selectedIndex = 0;

  Widget getBody() {
    if (_selectedIndex == 0) {
      return const ProfilePageWidget();
    } else if (_selectedIndex == 1) {
      return const RepeatPageWidget();
    } else if (_selectedIndex == 2) {
      return const PaintBoard(); /* пофиксить потом, 2 раза прописываю */
    } else {
      return const SuggestionsPageWidget();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _onSelectTub(int index) {
  //   if () {
  //     setState(() {
  //       _selectedIndex = index;
  //     });
  //   } else {
  //     Navigator.of(context).push<void>(WordsPageWidget.route()),
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
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
      body: Align(
        // alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.headline6),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headline5),
          ],
        ),
      ),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
