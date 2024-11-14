import 'package:flutter/material.dart';

class BmiKalkulator extends StatefulWidget {
  @override
  _BmiKalkulatorState createState() => _BmiKalkulatorState();
}

class _BmiKalkulatorState extends State<BmiKalkulator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0;
  String _result = "";

  void _calculateBMI() {
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi < 18.5) {
        _result = "Underweight";
      } else if (_bmi >= 18.5 && _bmi < 24.9) {
        _result = "Normal weight";
      } else if (_bmi >= 25 && _bmi < 29.9) {
        _result = "Overweight";
      } else {
        _result = "Obesity";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Kalkulator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmi == 0 ? '' : 'BMI: ${_bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}