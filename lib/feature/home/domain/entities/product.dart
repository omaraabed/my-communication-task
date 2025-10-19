class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
}

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });
}
