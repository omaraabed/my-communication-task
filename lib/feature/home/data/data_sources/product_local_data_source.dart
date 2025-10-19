import 'package:hive/hive.dart';

import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();

  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductModel> box;

  ProductLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await box.clear();
    for (var product in products) {
      await box.put(product.id, product);
    }
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return box.values.toList();
  }
}
