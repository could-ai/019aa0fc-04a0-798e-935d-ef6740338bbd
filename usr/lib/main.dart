import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/disclaimer_screen.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/mod_detail_screen.dart';

void main() {
  runApp(const ModEduApp());
}

class ModEduApp extends StatelessWidget {
  const ModEduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Mod Edu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E676), // Neon Green
          secondary: Color(0xFF651FFF), // Deep Purple
          surface: Color(0xFF121212),
          background: Color(0xFF000000),
          onPrimary: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFF050505),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF1E1E1E),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DisclaimerScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const ModDetailScreen(),
      },
    );
  }
}
