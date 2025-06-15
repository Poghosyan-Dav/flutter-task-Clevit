import '../entities/bottle.dart';

abstract class BottleRepository {
  Future<List<Bottle>> getBottles();
  Future<List<Bottle>> filterBottles(String query); // <- новое

}
