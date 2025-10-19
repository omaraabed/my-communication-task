import '../../../../core/utils/enums/cubit_states.dart';
import '../../domain/entities/product.dart';

class HomeState {
  CubitStates getProductState;
  List<Product>? productModel;

  HomeState({this.getProductState = CubitStates.initial, this.productModel});

  HomeState editState({
    CubitStates? getProductState,
    List<Product>? productModel,
  }) {
    return HomeState(
      getProductState: getProductState ?? this.getProductState,
      productModel: productModel ?? this.productModel,
    );
  }
}
