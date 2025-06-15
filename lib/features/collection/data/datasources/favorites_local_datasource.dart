import 'package:shared_preferences/shared_preferences.dart';

class FavoritesLocalDataSource {
  static const _favoritesKey = 'favorites';

  Future<SharedPreferences> _prefs() async => await SharedPreferences.getInstance();

  Future<void> toggleFavorite(String bottleId) async {
    final prefs = await _prefs();
    final current = prefs.getStringList(_favoritesKey) ?? [];
    if (current.contains(bottleId)) {
      current.remove(bottleId);
    } else {
      current.add(bottleId);
    }
    await prefs.setStringList(_favoritesKey, current);
  }

  Future<List<String>> getFavorites() async {
    final prefs = await _prefs();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<bool> isFavorite(String bottleId) async {
    final prefs = await _prefs();
    final favs = prefs.getStringList(_favoritesKey) ?? [];
    return favs.contains(bottleId);
  }
}