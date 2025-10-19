import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource local;
  final ProductRemoteDataSource remote;

  ProductRepositoryImpl({required this.local, required this.remote});

  @override
  Future<List<Product>> getProducts({int? limit}) async {
    final localData = await local.getCachedProducts();
    final remoteData = await remote.fetchProducts(limit: limit);

    if (remoteData.length != localData.length) {
      await local.cacheProducts(remoteData);
      return remoteData.map((e) => e.toEntity()).toList();
    } else {
      return localData.map((e) => e.toEntity()).toList();
    }
  }
}
