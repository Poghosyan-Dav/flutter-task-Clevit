import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_stateless_widget.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/color/app_colors.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/bottle.dart';
import '../utilities/assets/app_assets.dart';

class CollectionBody extends BaseStatelessWidget {
  final List<Bottle> bottles; // Your bottle list

  const CollectionBody({super.key, required this.bottles});

  @override
  Widget baseBuild(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7,
      ),
      itemCount: bottles.length,
      itemBuilder: (context, index) {
        final bottle = bottles[index];
        return GestureDetector(
          onTap: () {
            // Handle bottle tap
            context.push('/bottle/${bottle.id}', extra: bottle);
          },
          child: Container(

            decoration: BoxDecoration(
              color: getColors(context).boxColors,

              boxShadow: [
                BoxShadow(
                  color: getColors(context).boxColors.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bottle Image
                Expanded(
                  child: Center(
                    child: ClipRRect(

                      child: Image.asset(
                          AppAssets.bottleMaxImage,
                        fit: BoxFit.fill,

                        errorBuilder: (context, error, stackTrace) => Container(
                          color: getColors(context).boxColors,
                          child: Center(
                            child: Icon(
                              Icons.water_drop,
                              color: getColors(context).whiteColor,
                              size: 40.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Bottle Info
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title (ONES)
                      Text(
                        bottle.title.toUpperCase(),
                        style: getFonts(context).ebGaramondBold.copyWith(
                          fontSize: 12.sp,
                          color: getColors(context).whiteColor,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      // Distillery (Springbank)
                      Text(
                        bottle.distillery,
                        style: getFonts(context).ebGaramondMedium?.copyWith(
                          fontSize: 12.sp,
                          color: getColors(context).whiteColor.withOpacity(0.8),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      // Bottle Code (1992#1234)
                      Text(
                        '${bottle.title}#${bottle.type}',
                        style: getFonts(context).ebGaramondRegular?.copyWith(
                          fontSize: 12.sp,
                          color: getColors(context).yellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}