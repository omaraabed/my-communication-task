import 'package:bloc/bloc.dart';
import 'package:task/feature/home/domain/usecases/get_products.dart';

import '../../../../core/utils/enums/cubit_states.dart';
import '../../domain/entities/product.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProducts getProducts;

  HomeCubit(this.getProducts) : super(HomeState());

  void loadProducts({int limit = 6, bool isLoadMore = false}) async {
    if (!isLoadMore) {
      emit(state.editState(getProductState: CubitStates.loading));
    }
    try {
      List<Product> response = await getProducts.getProducts(limit: limit);

      if (isLoadMore) {
        final existingProducts = state.productModel ?? [];
        final allProducts = [...existingProducts, ...response];

        emit(
          state.editState(
            getProductState: CubitStates.success,
            productModel: allProducts,
          ),
        );
      } else {
        emit(
          state.editState(
            getProductState: CubitStates.success,
            productModel: response,
          ),
        );
      }
    } on Exception catch (e) {
      print("eeeerrrrrroooorrrr$e");
      emit(state.editState(getProductState: CubitStates.failure));
    }
  }
}
