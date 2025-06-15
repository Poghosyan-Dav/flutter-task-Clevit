import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'app.dart';
import 'features/collection/data/datasources/bottle_local_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final dataSource =  getIt<BottleLocalDataSource>();
  await dataSource.loadMockData();

  runApp(const MyApp());
}
