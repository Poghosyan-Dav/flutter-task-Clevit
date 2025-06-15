import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/bottle.dart';
import '../bloc/collection_bloc.dart';
import '../bloc/collection_event.dart';
import '../bloc/collection_state.dart';
import '../utilities/assets/app_assets.dart';
import '../utilities/strings/app_string.dart';
import '../widgets/base/base_stateless_widget.dart';
import '../widgets/collection_body.dart';

class CollectionPage extends BaseStatelessWidget {
  CollectionPage({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: getColors(context).mainAppColor,
            appBar: _buildAppBar(context, state),
            body: _buildBody(context, state),
          );
        },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, CollectionState state) {
    return AppBar(
      backgroundColor: getColors(context).mainAppColor,
      elevation: 0,
      title: Text(
        AppStrings.collection,
        style: getFonts(context).ebGaramondBold.copyWith(
          color: getColors(context).whiteColor,
        ),
      ),
      actions: [
        if (state is Loaded)
          IconButton(
            icon: SvgPicture.asset(
              state.showOnlyFavorites ? AppAssets.iconButtonNotification : AppAssets.iconButtonNotification,

            ),
            tooltip: AppStrings.rateThisBottle,
            onPressed: () {
              context.read<CollectionBloc>().add(
                const CollectionEvent.toggleShowOnlyFavorites(),
              );
            },
          ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: TextField(
            onChanged: (value) {
              context.read<CollectionBloc>().add(
                CollectionEvent.searchChanged(value),
              );
            },
            style: getFonts(context).ebGaramondMedium.copyWith(
              color: getColors(context).whiteColor,
            ),
            decoration: InputDecoration(
              hintText: '${AppStrings.search} ${AppStrings.bottleType.toLowerCase()}',
              hintStyle: getFonts(context).ebGaramondRegular.copyWith(
                color: getColors(context).grey,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: getColors(context).whiteColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: getColors(context).boxColors,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CollectionState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => Center(
        child: CircularProgressIndicator(
          color: getColors(context).yellowColor,
        ),
      ),
      error: (message) => Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: getFonts(context).ebGaramondMedium.copyWith(
              color: getColors(context).yellowColor,
            ),
          ),
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
                  ? AppStrings.noItemsFound
                  : AppStrings.collectionEmpty,
              style: getFonts(context).ebGaramondMedium.copyWith(
                color: getColors(context).whiteColor,
              ),
            ),
          );
        }

        // return ListView.separated(
        //   padding: EdgeInsets.symmetric(vertical: 8.h),
        //   itemCount: filteredList.length,
        //   separatorBuilder: (context, index) => SizedBox(height: 8.h),
        //   itemBuilder: (context, index) {
        //     final bottle = filteredList[index];
        //     final isFavorite = favorites.contains(bottle.id);
        //
        //     return Column(
        //       children: [
        //     Container(
        //       child: Text('dadas'),
        //     decoration: BoxDecoration(
        //     image: DecorationImage(
        //     image: const AssetImage(AppAssets.bottleMaxImage),
        //     fit: BoxFit.fill,
        //
        //     ),
        //     ),
        //     ),
        //         // Container(
        //         //   margin: EdgeInsets.symmetric(horizontal: 16.w),
        //         //   decoration: BoxDecoration(
        //         //     color: getColors(context).boxColors,
        //         //     borderRadius: BorderRadius.circular(12.r),
        //         //   ),
        //         //   child: ListTile(
        //         //     contentPadding: EdgeInsets.symmetric(
        //         //       horizontal: 16.w,
        //         //       vertical: 12.h,
        //         //     ),
        //         //     title: Text(
        //         //       bottle.title,
        //         //       style: getFonts(context).ebGaramondBold.copyWith(
        //         //         color: getColors(context).whiteColor,
        //         //       ),
        //         //     ),
        //         //     subtitle: Column(
        //         //       crossAxisAlignment: CrossAxisAlignment.start,
        //         //       children: [
        //         //         SizedBox(height: 4.h),
        //         //         Text(
        //         //           '${AppStrings.distillery}: ${bottle.distillery}',
        //         //           style: getFonts(context).ebGaramondMedium.copyWith(
        //         //             color: getColors(context).grey,
        //         //             fontSize: 14.sp,
        //         //           ),
        //         //         ),
        //         //         SizedBox(height: 2.h),
        //         //         Text(
        //         //           '${AppStrings.age}: ${bottle.age} | ${AppStrings.abv}: ${bottle.abv}%',
        //         //           style: getFonts(context).ebGaramondLight.copyWith(
        //         //             color: getColors(context).grey,
        //         //             fontSize: 12.sp,
        //         //           ),
        //         //         ),
        //         //       ],
        //         //     ),
        //         //     trailing: IconButton(
        //         //       icon: Icon(
        //         //         isFavorite ? Icons.favorite : Icons.favorite_border,
        //         //         color: isFavorite
        //         //             ? getColors(context).yellowColor
        //         //             : getColors(context).whiteColor,
        //         //       ),
        //         //       onPressed: () {
        //         //         context.read<CollectionBloc>().add(
        //         //           CollectionEvent.toggleFavorite(bottle.id),
        //         //         );
        //         //       },
        //         //     ),
        //         //     onTap: () {
        //         //       context.go('/bottle/${bottle.id}', extra: bottle);
        //         //     },
        //         //   ),
        //         // ),
        //       ],
        //     );
        //   },
        // );
        return CollectionBody(bottles: filteredList);
      },
    );
  }
}