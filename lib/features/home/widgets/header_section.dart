import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/services/location_service.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final LocationService _locationService = LocationService();

  String _locationText = "📍 正在取得位置...";

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    try {
      Position position = await _locationService.getCurrentLocation();

      setState(() {
        _locationText =
            "📍 ${position.latitude.toStringAsFixed(5)}, ${position.longitude.toStringAsFixed(5)}";
      });
    } catch (e) {
      setState(() {
        _locationText = "📍 無法取得位置";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _locationText,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "今天想吃什麼？",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "讓 Restaurant Roulette 幫你決定 🍜",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}