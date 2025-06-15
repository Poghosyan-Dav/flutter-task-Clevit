import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
import '../../../domain/entities/bottle.dart';

class HistoryTab extends StatefulWidget {
  final Bottle bottle;

  const HistoryTab({super.key, required this.bottle});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends BaseState<HistoryTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final historyItems = [
      {
        'label': 'Label',
        'title': widget.bottle.distillery,
        'description': '${widget.bottle.age} years, ${widget.bottle.country}'
      },
      {
        'label': 'Label',
        'title': widget.bottle.cask,
        'description': '${widget.bottle.bottler}, ABV: ${widget.bottle.abv}'
      }
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: historyItems.length,
      itemBuilder: (context, i) {
        final item = historyItems[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: getColors(context).yellowColor,
                    shape: BoxShape.circle,
                  ),
                ),
                if (i != historyItems.length - 1)
                  Container(
                    width: 2.w,
                    height: 60.h,
                    color: getColors(context).yellowColor,
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['label']!,
                    style: getFonts(context).ebGaramondSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: getColors(context).whiteColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item['title']!,
                    style: getFonts(context).ebGaramondBold.copyWith(
                      fontSize: 16.sp,
                      color: getColors(context).whiteColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item['description']!,
                    style: getFonts(context).ebGaramondRegular.copyWith(
                      fontSize: 12.sp,
                      color: getColors(context).whiteColor.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Attachments',
                    style: getFonts(context).ebGaramondMedium.copyWith(
                      fontSize: 12.sp,
                      color: getColors(context).whiteColor.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: List.generate(3, (index) {
                      return Container(
                        height: 50.h,
                        width: 50.h,
                        margin: EdgeInsets.only(right: 8.w),
                        color: getColors(context).moodyGray,
                      );
                    }),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
