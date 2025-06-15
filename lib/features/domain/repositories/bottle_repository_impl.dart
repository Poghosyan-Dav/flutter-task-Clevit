import 'package:injectable/injectable.dart';
import '../../collection/data/datasources/bottle_local_datasource.dart';
import '../../collection/data/models/bottle_model.dart';
import '../entities/bottle.dart';
import 'bottle_repository.dart';

@LazySingleton(as: BottleRepository)
class BottleRepositoryImpl implements BottleRepository {
  final BottleLocalDataSource localDataSource;

  BottleRepositoryImpl(this.localDataSource);

  @override
  Future<List<Bottle>> getBottles() async {
    final models = localDataSource.getAllBottles();
    return models.map(_mapToEntity).toList();
  }

  @override
  Future<List<Bottle>> filterBottles(String query) async {
    final models = localDataSource.filterBottles(query);
    return models.map(_mapToEntity).toList();
  }

  Bottle _mapToEntity(BottleModel model) => Bottle(
    id: model.id.toString(),
    title: model.title.toString(),
    imageUrl: model.imageUrl.toString(),
    price: model.price.toString(),
    distillery: model.distillery.toString(),
    country: model.country.toString(),
    type: model.type.toString(),
    bottler: model.bottler.toString(),
    cask: model.cask.toString(),
    abv: model.abv.toString(),
    age: model.age.toString(),
  );
}
