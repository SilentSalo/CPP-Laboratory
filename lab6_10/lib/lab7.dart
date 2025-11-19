import 'package:flutter/material.dart';

class Lab7Page extends StatelessWidget {
  const Lab7Page({super.key});

  @override
  Widget build(BuildContext context) {
    const double a = 8;   // відступ жовтого
    const double b = 28;  // відступ рожевого
    const double c = 68;  // висота синього
    const double blueWidth = 250;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Лабораторна робота №7"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Stack(
          children: [
            // жовтий шар
            Container(
              width: blueWidth + b + a,
              height: c + b + a,
              color: Colors.yellow,
            ),

            // рожевий шар
            Padding(
              padding: const EdgeInsets.only(top: a, left: a),
              child: Container(
                width: blueWidth + b,
                height: c + b,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 2),
                ),
              ),
            ),

            // синій шар з текстом
            Padding(
              padding: const EdgeInsets.only(top: a + b, left: a + b),
              child: Container(
                width: blueWidth,
                height: c,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border(
                    top: BorderSide(color: Colors.red, width: 2),
                    left: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'DART',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}