import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final numbers = TextEditingController();
  final percents = TextEditingController();

  String myResult = "Результат буде тут";

  void calculate() {
    double number = double.parse(numbers.text);
    double percent = double.parse(percents.text);
    double answer = number - (number * percent / 100);
    setState(() {
      myResult = answer.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Мій калькулятор")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numbers,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Введіть число (800)"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: percents,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Введіть відсоток (15)"),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: calculate, child: Text("Порахувати")),

            SizedBox(height: 20),
            Text(myResult, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
