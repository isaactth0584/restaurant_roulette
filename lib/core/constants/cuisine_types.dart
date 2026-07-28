class CuisineType {
  final String name;
  final String googleType;
  final String emoji;

  const CuisineType({
    required this.name,
    required this.googleType,
    required this.emoji,
  });
}

const cuisineTypes = [
  CuisineType(
    name: "全部餐廳",
    googleType: "restaurant",
    emoji: "🍽️",
  ),

  // 港式
  CuisineType(
    name: "港式料理",
    googleType: "chinese_restaurant",
    emoji: "🥢",
  ),
  CuisineType(
    name: "茶餐廳",
    googleType: "chinese_restaurant",
    emoji: "🍛",
  ),
  CuisineType(
    name: "大排檔",
    googleType: "chinese_restaurant",
    emoji: "🥡",
  ),
  CuisineType(
    name: "燒味",
    googleType: "chinese_restaurant",
    emoji: "🍖",
  ),
  CuisineType(
    name: "粥麵",
    googleType: "chinese_restaurant",
    emoji: "🍜",
  ),
  CuisineType(
    name: "點心",
    googleType: "dim_sum_restaurant",
    emoji: "🥟",
  ),
  CuisineType(
    name: "火鍋",
    googleType: "hot_pot_restaurant",
    emoji: "🍲",
  ),

  // 日本
  CuisineType(
    name: "日式料理",
    googleType: "japanese_restaurant",
    emoji: "🇯🇵",
  ),
  CuisineType(
    name: "拉麵",
    googleType: "ramen_restaurant",
    emoji: "🍜",
  ),
  CuisineType(
    name: "壽司",
    googleType: "sushi_restaurant",
    emoji: "🍣",
  ),
  CuisineType(
    name: "居酒屋",
    googleType: "izakaya_restaurant",
    emoji: "🍺",
  ),

  // 韓國
  CuisineType(
    name: "韓式料理",
    googleType: "korean_restaurant",
    emoji: "🇰🇷",
  ),
  CuisineType(
    name: "韓燒",
    googleType: "barbecue_restaurant",
    emoji: "🥩",
  ),

  // 東南亞
  CuisineType(
    name: "泰國菜",
    googleType: "thai_restaurant",
    emoji: "🇹🇭",
  ),
  CuisineType(
    name: "越南菜",
    googleType: "vietnamese_restaurant",
    emoji: "🇻🇳",
  ),
  CuisineType(
    name: "印度菜",
    googleType: "indian_restaurant",
    emoji: "🇮🇳",
  ),

  // 西餐
  CuisineType(
    name: "西餐",
    googleType: "restaurant",
    emoji: "🍽️",
  ),
  CuisineType(
    name: "意大利菜",
    googleType: "italian_restaurant",
    emoji: "🍝",
  ),
  CuisineType(
    name: "Pizza",
    googleType: "pizza_restaurant",
    emoji: "🍕",
  ),
  CuisineType(
    name: "漢堡",
    googleType: "hamburger_restaurant",
    emoji: "🍔",
  ),
  CuisineType(
    name: "牛扒",
    googleType: "steak_house",
    emoji: "🥩",
  ),

  // Cafe
  CuisineType(
    name: "Cafe",
    googleType: "cafe",
    emoji: "☕",
  ),
  CuisineType(
    name: "甜品",
    googleType: "dessert_restaurant",
    emoji: "🍰",
  ),
  CuisineType(
    name: "麵包店",
    googleType: "bakery",
    emoji: "🥐",
  ),

  // 快餐
  CuisineType(
    name: "快餐",
    googleType: "fast_food_restaurant",
    emoji: "🍟",
  ),
];