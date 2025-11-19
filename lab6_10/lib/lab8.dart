import 'package:flutter/material.dart';

class Lab8Page extends StatelessWidget {
  const Lab8Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Константи з Варіанта 7 (Lab 6)
    const double a = 250;
    const double b = 300;
    const double d = 200;
    const double j = 700;
    const double f = 200;
    const double g = 300;
    const double h = 250;
    const double m = 370;
    const int r = 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Лабораторна робота №8"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: j,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: a), // відступ зверху

                // перший рядок
                SizedBox(
                  height: b,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // жовтий контейнер
                      InfoBlock(
                        text: "Ще не вмерла Україна, і слава, і воля, ще нам, браття молодії, усміхнеться доля.",
                        color: Colors.yellow[300]!,
                        width: f,
                      ),
                      
                      // синій контейнер
                      InfoBlock(
                        text: "Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.",
                        color: Colors.blue[300]!,
                        width: g,
                      ),
                    ],
                  ),
                ),

                Container(height: h), // середній відступ

                // другий рядок
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: r, child: Container()),
                    
                    // прозорий контейнер
                    const InfoBlock(
                      text: "І покажем, що ми, браття, козацького роду.",
                      width: m,
                      height: d,
                      color: Colors.transparent,
                    ),

                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                
                Container(height: a), // відступ знизу
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double? height;

  const InfoBlock({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, // якщо null, Container підлаштується сам або візьме від батька
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}