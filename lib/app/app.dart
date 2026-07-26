import 'package:flutter/material.dart';
import 'package:restaurant_roulette/features/home/pages/home_page.dart';

class RestaurantRouletteApp extends StatelessWidget {
  const RestaurantRouletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Roulette',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}