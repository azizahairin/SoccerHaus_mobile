import 'package:flutter/material.dart';
import 'package:soccerhaus_mobile/widgets/left_drawer.dart';
import 'package:soccerhaus_mobile/widgets/product_card.dart';

// ===== ItemHomepage =====
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Azizah Khairinniswah";
  final String npm = "2406438504";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.list_alt, Colors.blue),
    ItemHomepage("My Products", Icons.inventory_2, Colors.green),
    ItemHomepage("Create Product", Icons.add_box, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SoccerHaus',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      drawer: const LeftDrawer(), 

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
              ],
            ),

            const SizedBox(height: 16.0),

            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Welcome to SoccerHaus!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),

            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((item) => ItemCard(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== InfoCard =====
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.6,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}