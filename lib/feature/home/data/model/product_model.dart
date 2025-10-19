import '../../domain/entities/product.dart' as entity;

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(dynamic json) {
    rate = (json['rate'] as num?)?.toDouble();
    count = (json['count'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}

class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num?)?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating?.toJson(),
  };

  entity.Product toEntity() {
    return entity.Product(
      id: id!.toInt(),
      title: title!,
      description: description!,
      price: price!.toDouble(),
      category: category!,
      image: image!,
      rating: entity.Rating(
        rate: rating?.rate?.toDouble() ?? 0.0,
        count: rating?.count?.toInt() ?? 0,
      ),
    );
  }
}
