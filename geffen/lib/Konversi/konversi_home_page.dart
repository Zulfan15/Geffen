import 'package:flutter/material.dart';
import 'package:geffen/Konversi/speed_conversion.dart';
import 'package:geffen/Konversi/volume_conversion.dart';
import 'temperature_converter.dart'; // Import halaman konversi suhu
import 'length_converter.dart'; // Import halaman konversi panjang


class KonversiHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Satuan'),
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
                  MaterialPageRoute(builder: (context) => TemperatureConverterPage()),
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
                  Icon(Icons.thermostat), // Ikon suhu
                  SizedBox(height: 4), // Spasi antara ikon dan teks
                  Text('Konversi Suhu'),
                ],
              ),
            ),
            // Tambahkan tombol untuk konversi lainnya di sini
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LengthConverterPage()),
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
                  Icon(Icons.swap_horiz),
                  SizedBox(height: 4),
                  Text('Konversi Panjang'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolumeConverterPage()),
                );
                // Navigasi ke halaman konversi lainnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.square_foot),
                  SizedBox(height: 4),
                  Text('Konversi Volume'),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigasi ke halaman konversi lainnya
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.orange,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.fitness_center),
            //       SizedBox(height: 4),
            //       Text('Konversi Berat'),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpeedConverterPage()),
                );
                // Navigasi ke halaman konversi lainnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 215, 159, 224),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.speed),
                  SizedBox(height: 4),
                  Text('Konversi Kecepatan'),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigasi ke halaman konversi lainnya
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.red,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.access_time),
            //       SizedBox(height: 4),
            //       Text('Konversi Waktu'),
            //     ],
            //   ),
            // ),
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
            //       Icon(Icons.attach_money),
            //       SizedBox(height: 4),
            //       Text('Konversi Mata Uang'),
            //     ],
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigasi ke halaman konversi lainnya
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.teal,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.data_usage),
            //       SizedBox(height: 4),
            //       Text('Konversi Data'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
