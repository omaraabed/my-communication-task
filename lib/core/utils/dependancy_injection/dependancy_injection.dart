import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../feature/home/data/data_sources/product_local_data_source.dart';
import '../../../feature/home/data/data_sources/product_remote_data_source.dart';
import '../../../feature/home/data/model/product_model.dart';
import '../../../feature/home/data/repositories/product_repository_impl.dart';
import '../../../feature/home/domain/repositories/product_repository.dart';
import '../../../feature/home/domain/usecases/get_products.dart';
import '../../../feature/home/presentation/manager/home_cubit.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // ====================== Hive Box ======================
  final productBox = Hive.box<ProductModel>('productsBox');
  getIt.registerSingleton<Box<ProductModel>>(productBox);

  // ====================== DioHelper ======================
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  // ====================== Data Sources ======================
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<DioHelper>()),
  );

  getIt.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(getIt<Box<ProductModel>>()),
  );

  // ====================== Repository ======================
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      local: getIt<ProductLocalDataSource>(),
      remote: getIt<ProductRemoteDataSource>(),
    ),
  );

  // ====================== UseCases ======================
  getIt.registerLazySingleton(() => GetProducts(getIt<ProductRepository>()));

  // ====================== Cubits ======================
  getIt.registerFactory(() => HomeCubit(getIt<GetProducts>()));
}
