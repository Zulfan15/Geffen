import 'package:flutter/material.dart';

class LengthConverterPage extends StatefulWidget {
  @override
  _LengthConverterPageState createState() => _LengthConverterPageState();
}

class _LengthConverterPageState extends State<LengthConverterPage> {
  // Daftar satuan panjang
  final List<String> units = ['Meter', 'Kilometer', 'Centimeter', 'Millimeter'];
  String fromUnit = 'Meter';
  String toUnit = 'Kilometer';
  double inputLength = 0.0;
  double result = 0.0;

  // Fungsi konversi panjang
  void convertLength() {
    double lengthInMeters = 0.0;

    // Konversi input ke meter terlebih dahulu
    switch (fromUnit) {
      case 'Meter':
        lengthInMeters = inputLength;
        break;
      case 'Kilometer':
        lengthInMeters = inputLength * 1000;
        break;
      case 'Centimeter':
        lengthInMeters = inputLength / 100;
        break;
      case 'Millimeter':
        lengthInMeters = inputLength / 1000;
        break;
    }

    // Konversi dari meter ke satuan tujuan
    switch (toUnit) {
      case 'Meter':
        result = lengthInMeters;
        break;
      case 'Kilometer':
        result = lengthInMeters / 1000;
        break;
      case 'Centimeter':
        result = lengthInMeters * 100;
        break;
      case 'Millimeter':
        result = lengthInMeters * 1000;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Panjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan panjang',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputLength = double.tryParse(value) ?? 0.0;
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
              onPressed: convertLength,
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
