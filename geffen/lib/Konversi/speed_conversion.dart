import 'package:flutter/material.dart';

class SpeedConverterPage extends StatefulWidget {
  @override
  _SpeedConverterPageState createState() => _SpeedConverterPageState();
}

class _SpeedConverterPageState extends State<SpeedConverterPage> {
  // Daftar satuan kecepatan
  final List<String> units = ['Kilometer per Jam', 'Mil per Jam', 'Meter per Detik', 'Knot'];
  String fromUnit = 'Kilometer per Jam';
  String toUnit = 'Meter per Detik';
  double inputSpeed = 0.0;
  double result = 0.0;

  // Fungsi konversi kecepatan
  void convertSpeed() {
    double speedInKmh = 0.0;

    // Konversi input ke kilometer per jam terlebih dahulu
    switch (fromUnit) {
      case 'Kilometer per Jam':
        speedInKmh = inputSpeed;
        break;
      case 'Mil per Jam':
        speedInKmh = inputSpeed * 1.60934;
        break;
      case 'Meter per Detik':
        speedInKmh = inputSpeed * 3.6;
        break;
      case 'Knot':
        speedInKmh = inputSpeed * 1.852;
        break;
    }

    // Konversi dari kilometer per jam ke satuan tujuan
    switch (toUnit) {
      case 'Kilometer per Jam':
        result = speedInKmh;
        break;
      case 'Mil per Jam':
        result = speedInKmh / 1.60934;
        break;
      case 'Meter per Detik':
        result = speedInKmh / 3.6;
        break;
      case 'Knot':
        result = speedInKmh / 1.852;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Kecepatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan kecepatan',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputSpeed = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (newValue) {
                    setState(() {
                      fromUnit = newValue!;
                    });
                  },
                  items: units.map((unit) {
                    return DropdownMenuItem(
                      child: Text(unit),
                      value: unit,
                    );
                  }).toList(),
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (newValue) {
                    setState(() {
                      toUnit = newValue!;
                    });
                  },
                  items: units.map((unit) {
                    return DropdownMenuItem(
                      child: Text(unit),
                      value: unit,
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertSpeed,
              child: Text('Konversi'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hasil: $result $toUnit',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
