import 'package:flutter/material.dart';
import 'package:geffen/Kalkulator/kalkulator_page.dart';

class KalkulatorHomePage extends StatelessWidget {
  const KalkulatorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
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
                  MaterialPageRoute(builder: (context) => KalkulatorPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 0, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calculate_outlined), // Ikon suhu
                  SizedBox(height: 4), // Spasi antara ikon dan teks
                  Text('Kalukator'), // Ubah teks tombol ke 'Kalkulator BMI'
                ],
              ),
            ),
            // // Tambahkan tombol untuk konversi lainnya di sini
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigasi ke halaman konversi lainnya
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.calculate),
            //       SizedBox(height: 4),
            //       Text('Kalkulator Kalori'), // Ubah teks tombol ke 'Kalkulator Kalori'
            //     ],
            //   ),
            // ),
            ],
        ),
      ),
    );
  }
}
