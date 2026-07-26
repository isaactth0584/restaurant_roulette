import 'package:flutter/material.dart';

class RestaurantRouletteApp extends StatelessWidget {
  const RestaurantRouletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Roulette',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Restaurant Roulette"),
        ),
        body: const Center(
          child: Text(
            "開始打造你的第一個 APP 🍜",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}