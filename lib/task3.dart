import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Color buttonColor = Colors.red;

  void checkNumber(String text) {
    if (text.isEmpty) return;
    int? number = int.tryParse(text);

    if (number == null) {
      return;
    }

    Color newColor;
    if (number < 30) {
      newColor = Colors.red;
    } else if (number >= 31 && number <= 70) {
      newColor = Colors.yellow;
    } else if (number >= 71) {
      newColor = Colors.green;
    } else {
      newColor = Colors.yellow;
    }
    setState(() {
      buttonColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Колір кнопки")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Введіть число",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                checkNumber(val);
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              child: Text("Це кнопка", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
