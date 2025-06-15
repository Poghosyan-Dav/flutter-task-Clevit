import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_event.freezed.dart';

@freezed
class CollectionEvent with _$CollectionEvent {
  const factory CollectionEvent.started() = Started;
  const factory CollectionEvent.refresh() = Refresh;
  const factory CollectionEvent.toggleFavorite(String id) = ToggleFavorite;
  const factory CollectionEvent.searchChanged(String query) = SearchChanged;
  const factory CollectionEvent.toggleShowOnlyFavorites() =
  ToggleShowOnlyFavorites;
}
