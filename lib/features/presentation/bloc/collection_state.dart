import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/bottle.dart';

part 'collection_state.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState.initial() = Initial;
  const factory CollectionState.loading() = Loading;

  const factory CollectionState.loaded({
    required List<Bottle> allBottles,
    required List<String> favorites,
    @Default('') String searchQuery,
    @Default(false) bool showOnlyFavorites,
  }) = Loaded;
  const factory CollectionState.error(String message) = Error;
}
