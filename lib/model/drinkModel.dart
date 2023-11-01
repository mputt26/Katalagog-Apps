class DrinkItem {
  final String name;
  final String image;
  final double price;
  final String description;

  DrinkItem({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory DrinkItem.fromJson(Map<String, dynamic> json) {
    return DrinkItem(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
    );
  }
}
