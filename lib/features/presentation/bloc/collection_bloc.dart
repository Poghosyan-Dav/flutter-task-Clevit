import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/bottle_repository.dart';
import 'collection_event.dart';
import 'collection_state.dart';

@injectable
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final BottleRepository  _repository;

  CollectionBloc(this._repository) : super(const CollectionState.initial()) {
    on<Started>(_onStarted);
    on<Refresh>(_onRefresh);
    on<ToggleFavorite>(_onToggleFavorite);
    on<SearchChanged>(_onSearchChanged);
    on<ToggleShowOnlyFavorites>(_onToggleShowOnlyFavorites);
  }

  Future<void> _onStarted(Started event, Emitter<CollectionState> emit) async {
    emit(const CollectionState.loading());
    try {
      final bottles = await _repository.getBottles();
      emit(CollectionState.loaded(
        allBottles: bottles,
        favorites: [],
      ));
    } catch (e) {
      emit(CollectionState.error('Failed to load collection'));
    }
  }

  Future<void> _onRefresh(Refresh event, Emitter<CollectionState> emit) async {
    try {
      final bottles = await _repository.getBottles();
      final currentState = state;
      if (currentState is Loaded) {
        emit(currentState.copyWith(allBottles: bottles));
      } else {
        emit(CollectionState.loaded(allBottles: bottles, favorites: []));
      }
    } catch (e) {
      emit(CollectionState.error('Failed to refresh collection'));
    }
  }

  void _onToggleFavorite(
      ToggleFavorite event,
      Emitter<CollectionState> emit,
      ) {
    final currentState = state;
    if (currentState is Loaded) {
      final updatedFavorites = List<String>.from(currentState.favorites);
      if (updatedFavorites.contains(event.id)) {
        updatedFavorites.remove(event.id);
      } else {
        updatedFavorites.add(event.id);
      }
      emit(currentState.copyWith(favorites: updatedFavorites));
    }
  }

  void _onSearchChanged(
      SearchChanged event,
      Emitter<CollectionState> emit,
      ) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(searchQuery: event.query));
    }
  }

  void _onToggleShowOnlyFavorites(
      ToggleShowOnlyFavorites event,
      Emitter<CollectionState> emit,
      ) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(
        showOnlyFavorites: !currentState.showOnlyFavorites,
      ));
    }
  }
}
