import '../repositories/product_repository.dart';
import '../entities/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> getProducts({int? limit}) async {
    return await repository.getProducts(limit: limit);
  }
}
