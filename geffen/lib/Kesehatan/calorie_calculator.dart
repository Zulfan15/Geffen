import 'package:flutter/material.dart';

class CalorieCalculatorPage extends StatefulWidget {
  @override
  _CalorieCalculatorPageState createState() => _CalorieCalculatorPageState();
}

class _CalorieCalculatorPageState extends State<CalorieCalculatorPage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String gender = 'Male';
  double activityLevel = 1.2;
  double dailyCalories = 0.0;

  void calculateCalories() {
    int age = int.tryParse(_ageController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    double height = double.tryParse(_heightController.text) ?? 0.0;

    double bmr;

    // Perhitungan BMR (Basal Metabolic Rate) berdasarkan jenis kelamin
    if (gender == 'Male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    // Kalori harian berdasarkan tingkat aktivitas
    dailyCalories = bmr * activityLevel;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Kalori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Umur (tahun)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jenis Kelamin:'),
                DropdownButton<String>(
                  value: gender,
                  onChanged: (newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items: ['Male', 'Female'].map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tingkat Aktivitas:'),
                DropdownButton<double>(
                  value: activityLevel,
                  onChanged: (newValue) {
                    setState(() {
                      activityLevel = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem(child: Text('Sedentary (1.2)'), value: 1.2),
                    DropdownMenuItem(child: Text('Lightly Active (1.375)'), value: 1.375),
                    DropdownMenuItem(child: Text('Moderately Active (1.55)'), value: 1.55),
                    DropdownMenuItem(child: Text('Very Active (1.725)'), value: 1.725),
                    DropdownMenuItem(child: Text('Super Active (1.9)'), value: 1.9),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateCalories,
              child: Text('Hitung Kalori Harian'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kalori Harian yang Dibutuhkan: ${dailyCalories.toStringAsFixed(2)} kkal',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
