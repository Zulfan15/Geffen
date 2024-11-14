import 'package:flutter/material.dart';
import 'package:geffen/Kesehatan/bmi_kalkulator.dart';
import 'package:geffen/Kesehatan/calorie_calculator.dart'; // Pastikan untuk mengimpor BmiKalkulator

class KesehatanHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BmiKalkulator()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.health_and_safety_outlined), // Ikon suhu
                  SizedBox(height: 4), // Spasi antara ikon dan teks
                  Text('Kalukator BMI'), // Ubah teks tombol ke 'Kalkulator BMI'
                ],
              ),
            ),
            // Tambahkan tombol untuk konversi lainnya di sini
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalorieCalculatorPage()),
                );
                // Navigasi ke halaman konversi lainnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calculate),
                  SizedBox(height: 4),
                  Text('Kalkulator Kalori'), // Ubah teks tombol ke 'Kalkulator Kalori'
                ],
              ),
            ),
            ],
        ),
      ),
    );
  }
}