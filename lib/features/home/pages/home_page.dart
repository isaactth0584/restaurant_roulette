import 'package:flutter/material.dart';

import '../../restaurant/models/restaurant.dart';
import '../controllers/home_controller.dart';
import '../widgets/filter_section.dart';
import '../widgets/header_section.dart';
import '../widgets/start_button.dart';
import '../widgets/wheel_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  Restaurant? _selectedRestaurant;

  void _drawRestaurant() {
    final restaurant = _controller.randomRestaurant();

    setState(() {
      _selectedRestaurant = restaurant;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("🎉 抽餐結果"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text("🍽️ 類型：${restaurant.category}"),
              Text("⭐ 評分：${restaurant.rating}"),
              Text("📍 地址：${restaurant.address}"),
              Text("🚶 距離：${restaurant.distance} km"),
              Text(
                restaurant.isOpen ? "🟢 營業中" : "🔴 已打烊",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("確定"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 40),

              const WheelSection(),
              const SizedBox(height: 40),

              FilterSection(),
              const SizedBox(height: 40),

              if (_selectedRestaurant != null)
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "🎯 本次抽中",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _selectedRestaurant!.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("🍽️ ${_selectedRestaurant!.category}"),
                        Text("⭐ ${_selectedRestaurant!.rating}"),
                        Text("📍 ${_selectedRestaurant!.address}"),
                      ],
                    ),
                  ),
                ),

              if (_selectedRestaurant != null)
                const SizedBox(height: 24),

              StartButton(
                onPressed: _drawRestaurant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}