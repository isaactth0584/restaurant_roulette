class Restaurant {
  final String id;
  final String name;
  final String category;
  final String address;
  final double rating;
  final int priceLevel;
  final double distance;
  final bool isOpen;
  final double latitude;
  final double longitude;

  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.rating,
    required this.priceLevel,
    required this.distance,
    required this.isOpen,
    required this.latitude,
    required this.longitude,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"] ?? "",
      name: json["displayName"]?["text"] ?? "Unknown Restaurant",
      category: "Restaurant",
      address: json["formattedAddress"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      priceLevel: json["priceLevel"] ?? 0,
      distance: 0,
      isOpen:
          json["currentOpeningHours"]?["openNow"] ??
          json["regularOpeningHours"]?["openNow"] ??
          false,
      latitude: (json["location"]?["latitude"] ?? 0).toDouble(),
      longitude: (json["location"]?["longitude"] ?? 0).toDouble(),
    );
  }
}