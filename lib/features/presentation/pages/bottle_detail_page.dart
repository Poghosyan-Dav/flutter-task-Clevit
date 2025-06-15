import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/assets/app_assets.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/bottle.dart';
import '../bloc/collection_bloc.dart';
import '../bloc/collection_event.dart';
import 'tabs/info_tab.dart';
import 'tabs/tasting_tab.dart';
import 'tabs/history_tab.dart';

class BottleDetailPage extends StatefulWidget {
  final Bottle bottle;

  const BottleDetailPage({super.key, required this.bottle});

  @override
  State<BottleDetailPage> createState() => _BottleDetailPageState();
}

class _BottleDetailPageState extends BaseState<BottleDetailPage> {
  int selectedIndex = 0;
  final List<String> tabs = ['Info', 'Tasting Notes', 'History'];
   bool _isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColors(context).mainAppColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Hero bottle image
                  if (_isOpen)
                  Hero(
                    tag: widget.bottle.id,
                    child: Image.asset(
                      AppAssets.bottleMinImage,
                      height: 300.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Title
                  if (_isOpen)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      widget.bottle.title,
                      style: getFonts(context).ebGaramondBold.copyWith(
                        fontSize: 22.sp,
                        color: getColors(context).whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Tabs
                  if (_isOpen)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        final isSelected = index == selectedIndex;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: BoxDecoration(
                                color: isSelected ? getColors(context).yellowColor : getColors(context).moodyGray,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Text(
                                  tabs[index],
                                  style: getFonts(context).ebGaramondSemiBold?.copyWith(
                                    color: isSelected ? getColors(context).blackColor : getColors(context).whiteColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (_isOpen)
                  // Selected Tab Content
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _buildTabContent(),
                  ),
                ],
              ),
            ),

            // Back Button
            Positioned.fill(
              top: 10.h,
              right: 10.w,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Genesis Collection'),

                      IconButton(
                        icon: SvgPicture.asset(AppAssets.closeImage),
                        onPressed: ()=>context.pop(),
                      )
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.genuineIcon2),

                      IconButton(
                        icon: SvgPicture.asset(AppAssets.vectorTopBarIcon),
                        onPressed: () {setState(() {
                          _isOpen = !_isOpen;
                        });},
                      )
                    ],)
                ]),

              ),
            ),
            if (_isOpen)
            // Bottom CTA
            Positioned(
              bottom: 20.h,
              left: 16.w,
              right: 16.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: getColors(context).yellowColor,
                  foregroundColor: getColors(context).blackColor,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  context.read<CollectionBloc>().add(CollectionEvent.toggleFavorite(widget.bottle.id));

                },
                child: Text(
                  'Add to my collection',
                  style: getFonts(context).ebGaramondBold.copyWith(fontSize: 16.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedIndex) {
      case 0:
        return InfoTab(bottle: widget.bottle);
      case 1:
        return TastingTab(bottle: widget.bottle);
      case 2:
        return HistoryTab(bottle: widget.bottle);
      default:
        return const SizedBox.shrink();
    }
  }
}