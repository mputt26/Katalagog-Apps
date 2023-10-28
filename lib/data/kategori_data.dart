class MenuCategory {
  final String name;
  final String image;

  MenuCategory({required this.name, required this.image});
}

List<MenuCategory> menuCategories = [
  MenuCategory(name: 'Makanan', image: 'url_to_food_image'),
  MenuCategory(name: 'Minuman', image: 'url_to_drink_image'),
  // Tambahkan kategori lain jika diperlukan
];
