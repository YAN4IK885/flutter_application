import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isEven = false;
  bool Divisible3 = false;
  bool Divisible5 = false;

  void checkNumber(String text) {
    int? number = int.tryParse(text);
    if (number == null || text.isEmpty) {
      setState(() {
        isEven = false;
        Divisible3 = false;
        Divisible5 = false;
      });
      return;
    }

    setState(() {
      isEven = (number % 2 == 0);
      Divisible3 = (number % 3 == 0);
      Divisible5 = (number % 5 == 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Перевірка подільності")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Введіть число (напр. 60)",
                  border: OutlineInputBorder(),
                ),
                onChanged: checkNumber,
              ),
            ),

            SizedBox(width: 10),

            Checkbox(value: isEven, onChanged: null, activeColor: Colors.red),

            SizedBox(width: 5),

            Checkbox(
              value: Divisible3,
              onChanged: null,
              activeColor: Colors.yellow.shade800,
            ),

            SizedBox(width: 5),

            Checkbox(
              value: Divisible5,
              onChanged: null,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
