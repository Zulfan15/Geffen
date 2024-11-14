import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  // Variabel untuk menampilkan input dan hasil
  String input = '';
  String result = '0';
  
  // Menyimpan operasi dan angka
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  // Fungsi untuk menambahkan angka atau simbol ke input
  void addInput(String value) {
    setState(() {
      input += value;
    });
  }

  // Fungsi untuk menghapus input
  void clear() {
    setState(() {
      input = '';
      result = '0';
      operator = '';
      num1 = 0;
      num2 = 0;
    });
  }

  // Fungsi untuk melakukan perhitungan
  void calculate() {
    try {
      if (operator.isEmpty || input.isEmpty) return;

      num2 = double.parse(input.split(operator).last);

      setState(() {
        switch (operator) {
          case '+':
            result = (num1 + num2).toString();
            break;
          case '-':
            result = (num1 - num2).toString();
            break;
          case '*':
            result = (num1 * num2).toString();
            break;
          case '/':
            result = num2 != 0 ? (num1 / num2).toString() : 'Error';
            break;
        }
        input = result;
        operator = '';
        num1 = 0;
        num2 = 0;
      });
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }

  // Fungsi untuk menambahkan operator
  void setOperator(String op) {
    if (input.isEmpty) return;

    setState(() {
      num1 = double.parse(input);
      operator = op;
      input += op;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(24),
              child: Text(
                input,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(24),
              child: Text(
                result,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Row pertama
                Row(
                  children: [
                    buildButton('7', addInput),
                    buildButton('8', addInput),
                    buildButton('9', addInput),
                    buildButton('/', setOperator),
                  ],
                ),
                // Row kedua
                Row(
                  children: [
                    buildButton('4', addInput),
                    buildButton('5', addInput),
                    buildButton('6', addInput),
                    buildButton('*', setOperator),
                  ],
                ),
                // Row ketiga
                Row(
                  children: [
                    buildButton('1', addInput),
                    buildButton('2', addInput),
                    buildButton('3', addInput),
                    buildButton('-', setOperator),
                  ],
                ),
                // Row keempat
                Row(
                  children: [
                    buildButton('0', addInput),
                    buildButton('C', (_) => clear()),
                    buildButton('=', (_) => calculate()),
                    buildButton('+', setOperator),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat tombol
  Widget buildButton(String text, Function(String) onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
