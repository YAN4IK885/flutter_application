import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final myController = TextEditingController();
  String resultText = "Тут буде результат";

  void convertBinary() {
    String text = myController.text;

    int? decimal = int.tryParse(text, radix: 2);

    setState(() {
      if (decimal == null) {
        resultText = "Це не бінарний код! Вводьте тільки 0 та 1";
      } else {
        resultText = decimal.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Бінарний конвертер")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Введіть 0 та 1 (напр. 1100)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: convertBinary,
              child: Text("Перевести у звичайне число"),
            ),

            SizedBox(height: 20),

            Text(
              resultText,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
