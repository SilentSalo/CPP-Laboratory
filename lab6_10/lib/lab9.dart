import 'package:flutter/material.dart';

class Lab9Page extends StatelessWidget {
  const Lab9Page({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Лабораторна робота №9"),
        backgroundColor: Colors.purple,
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
                Container(height: a),

                // перший рядок
                SizedBox(
                  height: b,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // жовтий контейнер
                      ActiveBlock(
                        text: "Ще не вмерла Україна, і слава, і воля, ще нам, браття молодії, усміхнеться доля.",
                        initialColor: Colors.yellow[300]!,
                        width: f,
                      ),
                      
                      // синій контейнер
                      ActiveBlock(
                        text: "Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.",
                        initialColor: Colors.blue[300]!,
                        width: g,
                      ),
                    ],
                  ),
                ),

                Container(height: h),

                // другий рядок
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: r, child: Container()),
                    
                    // прозорий контейнер
                    const ActiveBlock(
                      text: "І покажем, що ми, браття, козацького роду.",
                      width: m,
                      height: d,
                      initialColor: Colors.white, 
                    ),

                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                
                Container(height: a),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveBlock extends StatefulWidget {
  final String text;
  final Color initialColor;
  final double width;
  final double? height;

  const ActiveBlock({
    super.key,
    required this.text,
    required this.initialColor,
    required this.width,
    this.height,
  });

  @override
  State<ActiveBlock> createState() => _ActiveBlockState();
}

class _ActiveBlockState extends State<ActiveBlock> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _changeColor() {
    setState(() {
      if (_currentColor == Colors.yellow[300]) {
        _currentColor = Colors.blue[300]!;
      } else if (_currentColor == Colors.blue[300]) {
        _currentColor = Colors.transparent;
      } else {
        _currentColor = Colors.yellow[300]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _currentColor,
          border: Border.all(color: Colors.black, width: 2),
        ),
        duration: const Duration(milliseconds: 1000),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}