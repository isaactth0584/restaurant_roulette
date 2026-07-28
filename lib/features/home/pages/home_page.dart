import 'package:flutter/material.dart';

import '../../../core/constants/cuisine_types.dart';
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

  double _distance = 3;

  int _priceLevel = 0;

  CuisineType _selectedCuisine = cuisineTypes.first;

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    try {
      setState(() {
        _loading = true;
      });

      await _controller.loadNearbyRestaurants(
        radius: _distance * 1000,
        type: _selectedCuisine.googleType,
      );

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
    final candidates = _controller.restaurants.where((restaurant) {

      if (_priceLevel != 0 &&
          restaurant.priceLevel != _priceLevel) {
        return false;
      }

      return true;

    }).toList();

    if (candidates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("沒有符合條件的餐廳"),
        ),
      );
      return;
    }

    candidates.shuffle();

    final restaurant = candidates.first;

    setState(() {
      _selectedRestaurant = restaurant;
    });

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("🎉 抽中餐廳"),

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

              const SizedBox(height: 16),

              Text(
                "${restaurant.emoji} ${restaurant.category}",
              ),

              Text("⭐ ${restaurant.rating}"),

              Text(
                "💰 ${"⭐" * restaurant.priceLevel}",
              ),

              Text(
                "🚶 ${restaurant.distance.toStringAsFixed(2)} km",
              ),

              Text(
                "📍 ${restaurant.address}",
              ),

              Text(
                restaurant.isOpen
                    ? "🟢 營業中"
                    : "🔴 已打烊",
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
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

              const SizedBox(height: 32),

              const WheelSection(),

              const SizedBox(height: 32),

              FilterSection(
                distance: _distance,
                priceLevel: _priceLevel,
                selectedCuisine: _selectedCuisine,

                onDistanceChanged: (value) {
                  setState(() {
                    _distance = value;
                  });

                  _loadRestaurants();
                },

                onPriceChanged: (value) {
                  setState(() {
                    _priceLevel = value;
                  });
                },

                onCuisineChanged: (value) {
                  setState(() {
                    _selectedCuisine = value;
                  });

                  _loadRestaurants();
                },
              ),

              const SizedBox(height: 30),

              if (_selectedRestaurant != null)
                RestaurantCard(
                  restaurant: _selectedRestaurant!,
                ),

              if (_selectedRestaurant != null)
                const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: StartButton(
                  onPressed: _drawRestaurant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}