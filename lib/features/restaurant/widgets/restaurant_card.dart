import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
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
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              restaurant.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text("🍜 ${restaurant.category}"),
            Text("⭐ ${restaurant.rating}"),
            Text("📍 ${restaurant.address}"),
            Text("🚶 ${restaurant.distance} km"),
            Text(
              restaurant.isOpen ? "🟢 營業中" : "🔴 已打烊",
            ),
          ],
        ),
      ),
    );
  }
}