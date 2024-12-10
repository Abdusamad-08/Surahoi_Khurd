import 'package:flutter/material.dart';
import 'package:my_first_app/glavni.dart';
import 'package:my_first_app/perekhod.dart';
import 'package:my_first_app/suraho/suraho.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage1(),
    );
  }
}
