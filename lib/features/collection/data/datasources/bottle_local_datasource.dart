
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../models/bottle_model.dart';
@LazySingleton()
class BottleLocalDataSource {
  List<BottleModel> _cachedBottles = [];

  Future<void> cacheBottles(List<BottleModel> bottles) async {
    _cachedBottles = bottles;
// Optionally, persist this to local storage if needed.
  }

  List<BottleModel> getAllBottles() {
    return _cachedBottles;
  }

  List<BottleModel> filterBottles(String query) {
    return _cachedBottles
        .where((bottle) =>
    bottle.title!.toLowerCase().contains(query.toLowerCase()) ||
        bottle.distillery!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> loadMockData() async {
    final jsonString = await rootBundle.loadString('assets/mock/bottles.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final bottles = jsonList
        .map((item) => BottleModel.fromJson(item as Map<String, dynamic>))
        .toList();
    await cacheBottles(bottles);
  }
}