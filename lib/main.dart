import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hg_task/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000000,
          <int, Color>{
            50: Colors.black12,
            100: Colors.black26,
            200: Colors.black38,
            300: Colors.black45,
            400: Colors.black54,
            500: Colors.black,
            600: Colors.black87,
            700: Colors.black87,
            800: Colors.black87,
            900: Colors.black87,
          },
        ),
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black),
      ),
      home: const SplashScreen(),
    );
  }
}
