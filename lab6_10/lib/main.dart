import 'package:flutter/material.dart';

import 'lab6.dart';
import 'lab7.dart';
import 'lab8.dart';
import 'lab9.dart';
import 'lab10.dart';

void main() {
  runApp(const MaterialApp(
    home: MainMenu(),
  ));
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Головне меню (Лабораторні роботи №6-10)"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Лабораторна робота №6
          ListTile(
            leading: const Icon(Icons.looks_one, color: Colors.blue, size: 40),
            title: const Text("Лабораторна робота №6"),
            subtitle: const Text("Column, Row, Container, Expanded"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lab6Page()),
              );
            },
          ),
          const Divider(),

          // Лабораторна робота №7
          ListTile(
            leading: const Icon(Icons.looks_two, color: Colors.green, size: 40),
            title: const Text("Лабораторна робота №7"),
            subtitle: const Text("Stack, RichText, Positioned"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lab7Page()),
              );
            },
          ),
          const Divider(),

          // Лабораторна робота №8
          ListTile(
            leading: const Icon(Icons.looks_3, color: Colors.orange, size: 40),
            title: const Text("Лабораторна робота №8"),
            subtitle: const Text('Custom Stateless Widgets, Material Design'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lab8Page()),
              );
            },
          ),
          const Divider(),

          // Лабораторна робота №9
          ListTile(
            leading: const Icon(Icons.looks_4, color: Colors.purple, size: 40),
            title: const Text("Лабораторна робота №9"),
            subtitle: const Text('Custom Stateful Widgets'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lab9Page()),
              );
            },
          ),
          const Divider(),

          // Лабораторна робота №10
          ListTile(
            leading: const Icon(Icons.looks_5, color: Colors.teal, size: 40),
            title: const Text("Лабораторна робота №10"),
            subtitle: const Text('ListView, Image'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lab10Page()),
              );
            },
          ),
        ],
      ),
    );
  }
}