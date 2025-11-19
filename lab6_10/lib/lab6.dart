import 'package:flutter/material.dart';

class Lab6Page extends StatelessWidget {
  const Lab6Page({super.key});

  @override
  Widget build(BuildContext context) {
    // дані з таблиці
    const double a = 250;
    const double b = 300;
    const double d = 200;
    const double j = 700;
    const double f = 200;
    const double g = 300;
    const double h = 250;
    const double m = 370;
    const int r = 5;

    // підкреслений текст
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      // Додаємо Scaffold, щоб була стрілочка "Назад" і заголовок
      appBar: AppBar(
        title: const Text("Лабораторна робота №6"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // горизонтальний скрол
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
                      Container(
                        width: f, // висота береться з батьківського SizedBox
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow[300],
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Text(
                          "Ще не вмерла Україна, і слава, і воля, ще нам, браття молодії, усміхнеться доля.",
                          style: textStyle,
                        ),
                      ),
                      // синій контейнер
                      Container(
                        width: g, // висота береться з батьківського SizedBox
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Text(
                          "Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.",
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                // відступ між рядками
                Container(height: h),

                // другий рядок
                Row(
                  // height береться з дочірнього контейнера
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: r,
                      child: Container(),
                    ),

                    // нижній контейнер
                    Container(
                      width: m,
                      height: d,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Text(
                        "І покажем, що ми, браття, козацького роду.",
                        style: textStyle,
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
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