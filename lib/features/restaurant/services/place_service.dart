import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/restaurant.dart';

class PlaceService {
  final Dio _dio = Dio();

  static const String apiKey = "AIzaSyCykpQvowEKtR16cvEQOCcK6wXcS4BEMUI";

  Future<List<Restaurant>> searchNearbyRestaurants({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.post(
        "https://places.googleapis.com/v1/places:searchNearby",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "X-Goog-Api-Key": apiKey,
            "X-Goog-FieldMask":
                "places.id,"
                "places.displayName,"
                "places.formattedAddress,"
                "places.rating,"
                "places.priceLevel,"
                "places.location,"
                "places.currentOpeningHours.openNow",
          },
        ),
        data: jsonEncode({
          "includedTypes": ["restaurant"],
          "maxResultCount": 20,
          "locationRestriction": {
            "circle": {
              "center": {
                "latitude": latitude,
                "longitude": longitude,
              },
              "radius": 3000,
            }
          }
        }),
      );

      final List places = response.data["places"] ?? [];

      return places
          .map((json) => Restaurant.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.data.toString() ?? "Failed to fetch nearby restaurants.",
      );
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}