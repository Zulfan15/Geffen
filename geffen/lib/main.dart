import 'package:flutter/material.dart';
import 'package:geffen/login_page.dart';
import 'package:geffen/register_page.dart';
import 'package:geffen/home_page.dart';
import 'package:geffen/splash_screen.dart'; // Import halaman Splash Screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Konversi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Atur rute awal ke splash screen
      routes: {
        '/splash': (context) => SplashScreenPage(), // Rute splash screen
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
