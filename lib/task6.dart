import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  String getDayString(int number) {
    int lastTwoDigits = number % 100;
    int lastDigit = number % 10;

    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
      return "$number днів";
    }

    if (lastDigit == 1) {
      return "$number день";
    } else if (lastDigit >= 2 && lastDigit <= 4) {
      return "$number дні";
    } else {
      return "$number днів";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Лічильник днів")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getDayString(count),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  child: Text("v", style: TextStyle(fontSize: 24)),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: increment,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  child: Text("^", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
