import 'package:dio/dio.dart';
import 'package:task/core/utils/networking/api_constants.dart';
import '../../../../core/utils/networking/api_service.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts({int? limit});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioHelper dioHelper;

  ProductRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<List<ProductModel>> fetchProducts({int? limit}) async {
    try {
      var response = await dioHelper.getData(
        endpoint: ApiConstants.product,
        query: limit != null ? {"limit": limit} : null,
      );

      if (response.statusCode == 200) {
        List data = response.data as List;
        List<ProductModel> products = data
            .map((item) => ProductModel.fromJson(item))
            .toList();
        print("pprrrooodddduuuccccttt${products}");

        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
