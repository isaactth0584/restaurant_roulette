import 'dart:math';

import '../../restaurant/data/restaurant_data.dart';
import '../../restaurant/models/restaurant.dart';

class HomeController {
  final Random _random = Random();

  Restaurant randomRestaurant() {
    return restaurantList[_random.nextInt(restaurantList.length)];
  }
}