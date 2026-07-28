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
      elevation: 3,
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

            const SizedBox(height: 20),

            Text(
              "${restaurant.emoji} ${restaurant.category}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "⭐ ${restaurant.rating}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "💰 ${restaurant.priceText}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "📍 ${restaurant.address}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "🚶 ${restaurant.distance.toStringAsFixed(2)} km",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              restaurant.isOpen ? "🟢 營業中" : "🔴 已打烊",
              style: TextStyle(
                fontSize: 16,
                color: restaurant.isOpen
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}