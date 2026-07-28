import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/restaurant.dart';

class PlaceService {
  final Dio _dio = Dio();

  static const String apiKey = "AIzaSyCykpQvowEKtR16cvEQOCcK6wXcS4BEMUI";

  Future<List<Restaurant>> searchNearbyRestaurants({
    required double latitude,
    required double longitude,
    String type = "restaurant",
    double radius = 3000,
  }) async {
    try {
      print("===== 開始呼叫 Google Places =====");

      final response = await _dio.post(
        "https://places.googleapis.com/v1/places:searchNearby",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "X-Goog-Api-Key": apiKey,
            "X-Goog-FieldMask":
                "places.id,"
                "places.displayName,"
                "places.primaryType,"
                "places.formattedAddress,"
                "places.rating,"
                "places.priceLevel,"
                "places.location,"
                "places.currentOpeningHours.openNow",
          },
        ),
        data: jsonEncode({
          "includedTypes": [type],
          "maxResultCount": 20,
          "locationRestriction": {
            "circle": {
              "center": {
                "latitude": latitude,
                "longitude": longitude,
              },
              "radius": radius,
            }
          }
        }),
      );

      print(response.data);

      final List places = response.data["places"] ?? [];

      final restaurants = places
          .map(
            (json) => Restaurant.fromJson(
              json,
              latitude,
              longitude,
            ),
          )
          // 不抽到已打烊
          .where((restaurant) => restaurant.isOpen)
          // 評分至少3星
          .where((restaurant) => restaurant.rating >= 3)
          .toList();

      return restaurants;
    } on DioException catch (e) {
      print("========== Google Places Error ==========");
      print(e.response?.statusCode);
      print(e.response?.data);

      throw Exception(
        e.response?.data.toString() ??
            "Failed to fetch nearby restaurants.",
      );
    } catch (e) {
      print(e);
      throw Exception("Unexpected error: $e");
    }
  }
}