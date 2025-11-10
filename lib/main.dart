import 'package:flutter/material.dart';
import 'package:soccerhaus_mobile/screens/menu.dart';

void main() {
  runApp(const SoccerHausApp());
}

class SoccerHausApp extends StatelessWidget {
  const SoccerHausApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoccerHaus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(), // 
    );
  }
}
