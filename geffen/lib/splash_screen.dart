import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Menunggu 5 detik sebelum berpindah ke halaman utama
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login'); // Ganti '/home' dengan rute halaman utama Anda
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan foto
            Image.asset('assets/zulfan.jpg', width: 150, height: 150),
            SizedBox(height: 24),
            // Menampilkan judul aplikasi
            Text(
              'Geffen',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Menampilkan NIM dan nama
            Text(
              'NIM: 152022243',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Nama: M.Zulfan A.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
