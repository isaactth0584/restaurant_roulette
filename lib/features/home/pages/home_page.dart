import 'package:flutter/material.dart';

import '../../restaurant/models/restaurant.dart';
import '../../restaurant/widgets/restaurant_card.dart';
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

  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    try {
      await _controller.loadNearbyRestaurants();

      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  void _drawRestaurant() {
    final restaurant = _controller.randomRestaurant();

    if (restaurant == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("附近沒有找到餐廳"),
        ),
      );
      return;
    }

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
              Text("⭐ ${restaurant.rating}"),
              Text("📍 ${restaurant.address}"),
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
    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

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

              const FilterSection(),
              const SizedBox(height: 40),

              if (_selectedRestaurant != null)
                RestaurantCard(
                  restaurant: _selectedRestaurant!,
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