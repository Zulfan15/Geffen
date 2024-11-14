import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController _inputController = TextEditingController();
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  double _result = 0.0;

  void _convertTemperature() {
    double input = double.tryParse(_inputController.text) ?? 0.0;
    double output = 0.0;

    if (_fromUnit == 'Celsius') {
      if (_toUnit == 'Fahrenheit') {
        output = (input * 9/5) + 32;
      } else if (_toUnit == 'Kelvin') {
        output = input + 273.15;
      } else {
        output = input;
      }
    } else if (_fromUnit == 'Fahrenheit') {
      if (_toUnit == 'Celsius') {
        output = (input - 32) * 5/9;
      } else if (_toUnit == 'Kelvin') {
        output = (input - 32) * 5/9 + 273.15;
      } else {
        output = input;
      }
    } else if (_fromUnit == 'Kelvin') {
      if (_toUnit == 'Celsius') {
        output = input - 273.15;
      } else if (_toUnit == 'Fahrenheit') {
        output = (input - 273.15) * 9/5 + 32;
      } else {
        output = input;
      }
    }

    setState(() {
      _result = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konversi Suhu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Suhu',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _fromUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromUnit = newValue!;
                    });
                  },
                  items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _toUnit = newValue!;
                    });
                  },
                  items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $_result $_toUnit',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

