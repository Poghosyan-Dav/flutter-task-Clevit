import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/bottle.dart';

class InfoTab extends StatefulWidget {
  final Bottle bottle;

  const InfoTab({super.key, required this.bottle});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends BaseState<InfoTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final infoItems = {
      'Distillery': widget.bottle.distillery,
      'Country': widget.bottle.country,
      'Type': widget.bottle.type,
      'Bottler': widget.bottle.bottler,
      'Cask': widget.bottle.cask,
      'ABV': '${widget.bottle.abv}%',
      'Age': '${widget.bottle.age} years',
    };

    return Container(
      color: getColors(context).boxColors,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title

            SizedBox(height: 24.h),

            // Info Fields
            ...infoItems.entries.map((entry) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: getFonts(context).ebGaramondSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: getColors(context).whiteColor,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        entry.value,
                        textAlign: TextAlign.right,
                        style: getFonts(context).ebGaramondMedium.copyWith(
                          fontSize: 16.sp,
                          color: getColors(context).grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),



                  ],
        ),
      ),
    );
  }
}
