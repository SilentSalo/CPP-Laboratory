import 'package:flutter/material.dart';

// модель даних
class Scientist {
  final String name;
  final String description;
  final String imagePath;

  Scientist({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class Lab10Page extends StatefulWidget {
  const Lab10Page({super.key});

  @override
  State<Lab10Page> createState() => _Lab10PageState();
}

class _Lab10PageState extends State<Lab10Page> {
  Scientist? _selectedScientist;

  // список вчених
  final List<Scientist> scientists = [
    Scientist(
      name: "Галілео Галілей",
      description: "Італійський мислитель, засновник класичної механіки, фізик, астроном, математик.",
      imagePath: "images/galileo.jpg",
    ),
    Scientist(
      name: "Нікола Тесла",
      description: "Винахідник у галузі електротехніки та радіотехніки, інженер, фізик.",
      imagePath: "images/tesla.jpeg",
    ),
    Scientist(
      name: "Альберт Ейнштейн",
      description: "Один із найвизначніших фізиків XX століття. Лауреат Нобелівської премії 1921 року.",
      imagePath: "images/einstein.jpg",
    ),
    Scientist(
      name: "Дмитро Менделєєв",
      description: "Хімік, один з авторів періодичної таблиці хімічних елементів.",
      imagePath: "images/mendeleev.jpg",
    ),
    Scientist(
      name: "Марія К'юрі",
      description: "Видатний фізик і хімік, двічі лауреат Нобелівської премії за дослідження радіоактивності.",
      imagePath: "images/curie.jpg",
    ),
    Scientist(
      name: "Ісаак Ньютон",
      description: "Англійський фізик, математик, астроном, натураліст і філософ, один із творців класичної механіки.",
      imagePath: "images/newton.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Лабораторна робота №10"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: scientists.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = scientists[index];
                final isSelected = _selectedScientist == item;

                return ListTile(
                  tileColor: isSelected ? Colors.teal[50] : null,
                  leading: const Icon(Icons.person, color: Colors.teal),
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.teal : Colors.black,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_downward, size: 16, color: Colors.grey),
                  onTap: () {
                    setState(() {
                      _selectedScientist = item;
                    });
                  },
                );
              },
            ),
          ),

          // якщо хтось обраний
          if (_selectedScientist != null) ...[
            const Divider(height: 1, thickness: 2, color: Colors.teal),
            
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[100],
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // картинка
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      _selectedScientist!.imagePath,
                      width: 120,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 120,
                          height: 180,
                          color: Colors.grey[300],
                          child: const Icon(Icons.person, size: 50),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(width: 15),

                  // ім'я + опис
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedScientist!.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _selectedScientist!.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            // якщо не обрано
             Container(
              height: 50,
              color: Colors.grey[200],
              alignment: Alignment.center,
              child: const Text("Оберіть винахідника зі списку"),
            ),
          ],
        ],
      ),
    );
  }
}