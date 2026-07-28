import 'dart:math';

import '../../../core/services/location_service.dart';
import '../../restaurant/models/restaurant.dart';
import '../../restaurant/services/place_service.dart';

class HomeController {
  final LocationService _locationService = LocationService();
  final PlaceService _placeService = PlaceService();

  final Random _random = Random();

  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  Future<void> loadNearbyRestaurants({
    required double radius,
    required String type,
  }) async {
    final position = await _locationService.getCurrentLocation();

    _restaurants = await _placeService.searchNearbyRestaurants(
      latitude: position.latitude,
      longitude: position.longitude,
      radius: radius,
      type: type,
    );
  }

  Restaurant? randomRestaurant() {
    if (_restaurants.isEmpty) return null;

    return _restaurants[_random.nextInt(_restaurants.length)];
  }
}