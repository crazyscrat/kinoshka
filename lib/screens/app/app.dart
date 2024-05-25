import 'package:flutter/material.dart';
import 'package:kinoshka/navigation/main_navigation.dart';
import 'package:kinoshka/settings/app_colors.dart';
import 'package:kinoshka/settings/app_text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: AppText.title,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'), // Russian
        Locale('en', 'EN'), // English
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.bottomBackgroundColor,
            selectedItemColor: AppColors.bottomSelectedItemColor,
            unselectedItemColor: AppColors.bottomUnselectedItemColor,

          )
      ),
      onGenerateRoute: MainNavigation.onGenerateRoute,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loaderScreen,
    );
  }
}
