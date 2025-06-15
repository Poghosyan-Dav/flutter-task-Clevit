import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../bloc/collection_bloc.dart';
import '../bloc/collection_event.dart';
import '../bloc/collection_state.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CollectionBloc>()..add(const CollectionEvent.started()),
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Collection'),
              actions: [
                if (state is Loaded)
                  IconButton(
                    icon: Icon(
                      state.showOnlyFavorites ? Icons.favorite : Icons.favorite_outline,
                      color: state.showOnlyFavorites ? Colors.redAccent : null,
                    ),
                    tooltip: 'Show only favorites',
                    onPressed: () {
                      context.read<CollectionBloc>().add(
                        const CollectionEvent.toggleShowOnlyFavorites(),
                      );
                    },
                  ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: TextField(
                    onChanged: (value) {
                      context.read<CollectionBloc>().add(
                        CollectionEvent.searchChanged(value),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by name or type...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
            body: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(message, textAlign: TextAlign.center),
                ),
              ),
              loaded: (allBottles, favorites, searchQuery, showOnlyFavorites) {
                final filteredList = allBottles.where((bottle) {
                  final matchesSearch = bottle.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
                      bottle.type.toLowerCase().contains(searchQuery.toLowerCase());

                  final isFavorite = favorites.contains(bottle.id);
                  final matchesFavoriteFilter = !showOnlyFavorites || isFavorite;

                  return matchesSearch && matchesFavoriteFilter;
                }).toList();

                if (filteredList.isEmpty) {
                  return Center(
                    child: Text(
                      searchQuery.isNotEmpty || showOnlyFavorites
                          ? 'No bottles match your filters.'
                          : 'Your collection is empty.',
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final bottle = filteredList[index];
                    final isFavorite = favorites.contains(bottle.id);

                    return ListTile(
                      title: Text(bottle.title),
                      subtitle: Text(bottle.type),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.redAccent : null,
                        ),
                        onPressed: () {
                          context.read<CollectionBloc>().add(
                            CollectionEvent.toggleFavorite(bottle.id),
                          );
                        },
                      ),
                      onTap: () {
                        context.go('/bottle/${bottle.id}', extra: bottle);
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}