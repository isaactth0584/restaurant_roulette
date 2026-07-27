class Restaurant {
  final String id;
  final String name;
  final String category;
  final String address;
  final double rating;
  final int priceLevel;
  final double distance;
  final bool isOpen;

  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.rating,
    required this.priceLevel,
    required this.distance,
    required this.isOpen,
  });
}