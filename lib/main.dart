import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utils/dependancy_injection/dependancy_injection.dart';
import 'feature/home/data/model/product_hive_adapters.dart';
import 'feature/home/data/model/product_model.dart';
import 'task_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<ProductModel>('productsBox');
  await setupGetIt();

  runApp(const TaskApp());
}
