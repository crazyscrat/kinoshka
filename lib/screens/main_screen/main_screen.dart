import 'package:flutter/material.dart';
import 'package:kinoshka/domain/factories/screen_factory.dart';
import 'package:kinoshka/domain/services/auth_service.dart';
import 'package:kinoshka/navigation/main_navigation.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text.dart';
import 'package:kinoshka/settings/app_text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _authService = AuthService();
  final _screenFactory = ScreenFactory();
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            AppText.title,
            style: AppTextStyle.title,
          ),
        ),
        leading: const Icon(Icons.menu, color: AppIconStyle.appBarIconColor),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search_rounded,
              color: AppIconStyle.appBarIconColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppIconStyle.appBarIconColor,
              ),
              onPressed: () {
                _authService.logOut();
                Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.auth);
              },
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makeTopList(),
          _screenFactory.makeFilmsList(),
          _screenFactory.makeSerialsList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Популярное'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Фильмы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video), label: 'Сериалы'),
        ],
        onTap: _onSelectTab,
      ),
    );
  }

  void _onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
}


