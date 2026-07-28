import 'package:geolocator/geolocator.dart';

import '../../../core/constants/cuisine_types.dart';

class Restaurant {
  final String id;
  final String name;

  /// Google Places Type
  final String primaryType;

  final String address;
  final double rating;
  final int priceLevel;

  /// km
  final double distance;

  final bool isOpen;

  final double latitude;
  final double longitude;

  const Restaurant({
    required this.id,
    required this.name,
    required this.primaryType,
    required this.address,
    required this.rating,
    required this.priceLevel,
    required this.distance,
    required this.isOpen,
    required this.latitude,
    required this.longitude,
  });

  //========================
  // 顯示料理名稱
  //========================

  String get category {
    try {
      return cuisineTypes
          .firstWhere(
            (e) => e.googleType == primaryType,
          )
          .name;
    } catch (_) {
      return "其他";
    }
  }

  //========================
  // Emoji
  //========================

  String get emoji {
    try {
      return cuisineTypes
          .firstWhere(
            (e) => e.googleType == primaryType,
          )
          .emoji;
    } catch (_) {
      return "🍽️";
    }
  }

  //========================
  // 價格文字
  //========================

  String get priceText {
    switch (priceLevel) {
      case 0:
        return "未知";

      case 1:
        return "\$";

      case 2:
        return "\$\$";

      case 3:
        return "\$\$\$";

      case 4:
        return "\$\$\$\$";

      default:
        return "未知";
    }
  }

  factory Restaurant.fromJson(
    Map<String, dynamic> json,
    double userLat,
    double userLng,
  ) {
    final lat =
        (json["location"]?["latitude"] ?? 0).toDouble();

    final lng =
        (json["location"]?["longitude"] ?? 0).toDouble();

    final distanceInMeter = Geolocator.distanceBetween(
      userLat,
      userLng,
      lat,
      lng,
    );

    //-----------------------------
    // Google Places Price Level
    //-----------------------------

    int price = 0;

    final level = json["priceLevel"];

    if (level is int) {
      price = level;
    } else if (level is String) {
      switch (level) {
        case "PRICE_LEVEL_FREE":
          price = 0;
          break;

        case "PRICE_LEVEL_INEXPENSIVE":
          price = 1;
          break;

        case "PRICE_LEVEL_MODERATE":
          price = 2;
          break;

        case "PRICE_LEVEL_EXPENSIVE":
          price = 3;
          break;

        case "PRICE_LEVEL_VERY_EXPENSIVE":
          price = 4;
          break;

        default:
          price = 0;
      }
    }

    return Restaurant(
      id: json["id"] ?? "",

      name:
          json["displayName"]?["text"] ??
          "Unknown Restaurant",

      primaryType:
          json["primaryType"] ?? "restaurant",

      address:
          json["formattedAddress"] ?? "",

      rating:
          (json["rating"] ?? 0).toDouble(),

      priceLevel: price,

      distance:
          distanceInMeter / 1000,

      isOpen:
          json["currentOpeningHours"]?["openNow"] ??
          false,

      latitude: lat,

      longitude: lng,
    );
  }
}