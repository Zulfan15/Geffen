import 'package:flutter/material.dart';

class VolumeConverterPage extends StatefulWidget {
  @override
  _VolumeConverterPageState createState() => _VolumeConverterPageState();
}

class _VolumeConverterPageState extends State<VolumeConverterPage> {
  // Daftar satuan volume
  final List<String> units = ['Liter', 'Mililiter', 'Gallon', 'Cubic Meter'];
  String fromUnit = 'Liter';
  String toUnit = 'Mililiter';
  double inputVolume = 0.0;
  double result = 0.0;

  // Fungsi konversi volume
  void convertVolume() {
    double volumeInLiters = 0.0;

    // Konversi input ke liter terlebih dahulu
    switch (fromUnit) {
      case 'Liter':
        volumeInLiters = inputVolume;
        break;
      case 'Mililiter':
        volumeInLiters = inputVolume / 1000;
        break;
      case 'Gallon':
        volumeInLiters = inputVolume * 3.78541;
        break;
      case 'Cubic Meter':
        volumeInLiters = inputVolume * 1000;
        break;
    }

    // Konversi dari liter ke satuan tujuan
    switch (toUnit) {
      case 'Liter':
        result = volumeInLiters;
        break;
      case 'Mililiter':
        result = volumeInLiters * 1000;
        break;
      case 'Gallon':
        result = volumeInLiters / 3.78541;
        break;
      case 'Cubic Meter':
        result = volumeInLiters / 1000;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Volume'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan volume',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputVolume = double.tryParse(value) ?? 0.0;
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
              onPressed: convertVolume,
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
