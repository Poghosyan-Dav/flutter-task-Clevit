// import 'package:flutter/material.dart';
// import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
// import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../domain/entities/bottle.dart';
//
// class TastingTab extends StatefulWidget {
//   final Bottle bottle;
//
//   const TastingTab({super.key, required this.bottle});
//
//   @override
//   State<TastingTab> createState() => _TastingTabState();
// }
//
// class _TastingTabState extends BaseState<TastingTab> with AutomaticKeepAliveClientMixin {
//   final Map<String, double> tastingRatings = {
//     'Nose': 0,
//     'Palate': 0,
//     'Finish': 0,
//   };
//
//   final TextEditingController notesController = TextEditingController();
//
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   void dispose() {
//     notesController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Bottle Image
//
//           SizedBox(height: 16.h),
//
//           // Bottle title
//           Center(
//             child: Text(
//               widget.bottle.title,
//               style: getFonts(context).ebGaramondBold.copyWith(
//                 fontSize: 20.sp,
//                 color: getColors(context).yellowColor,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(height: 24.h),
//
//           // Tasting group ratings
//           ...tastingRatings.keys.map((category) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   category,
//                   style: getFonts(context).ebGaramondSemiBold.copyWith(
//                     fontSize: 16.sp,
//                     color: getColors(context).whiteColor,
//                   ),
//                 ),
//                 Slider(
//                   value: tastingRatings[category]!,
//                   onChanged: (value) {
//                     setState(() {
//                       tastingRatings[category] = value;
//                     });
//                   },
//                   min: 0,
//                   max: 10,
//                   divisions: 10,
//                   label: tastingRatings[category]!.toStringAsFixed(1),
//                   activeColor: getColors(context).yellowColor,
//                   inactiveColor: getColors(context).grey,
//                 ),
//                 SizedBox(height: 12.h),
//               ],
//             );
//           }),
//
//           SizedBox(height: 16.h),
//
//           // Notes input
//           TextField(
//             controller: notesController,
//             maxLines: 4,
//             style: getFonts(context).ebGaramondMedium.copyWith(
//               fontSize: 14.sp,
//               color: getColors(context).whiteColor,
//             ),
//             decoration: InputDecoration(
//               labelText: 'Your notes',
//               labelStyle: getFonts(context).ebGaramondMedium.copyWith(
//                 color: getColors(context).grey,
//               ),
//               filled: true,
//               fillColor: getColors(context).boxColors,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12.r),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: EdgeInsets.all(16.w),
//             ),
//           ),
//
//
//
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/bottle.dart';

class TastingTab extends StatefulWidget {
  final Bottle bottle;

  const TastingTab({super.key, required this.bottle});

  @override
  State<TastingTab> createState() => _TastingTabState();
}

class _TastingTabState extends BaseState<TastingTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget _buildTastingSection(String title, List<String> lines) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: getColors(context).boxColors,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getFonts(context).ebGaramondBold.copyWith(
              fontSize: 16.sp,
              color: getColors(context).whiteColor,
            ),
          ),
          ...lines.map((line) => Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              line,
              style: getFonts(context).ebGaramondMedium.copyWith(
                fontSize: 14.sp,
                color: getColors(context).whiteColor,
              ),
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tasting Notes Title
          Text(
            "Tasting notes",
            style: getFonts(context).ebGaramondSemiBold.copyWith(
              fontSize: 18.sp,
              color: getColors(context).whiteColor,
            ),
          ),
          Text(
            "by Charles MacLean MBE",
            style: getFonts(context).ebGaramondMedium.copyWith(
              fontSize: 14.sp,
              color: getColors(context).grey,
            ),
          ),
          SizedBox(height: 16.h),

          _buildTastingSection("Nose", ["Description", "Description", "Description"]),
          _buildTastingSection("Palate", ["Description", "Description", "Description"]),
          _buildTastingSection("Finish", ["Description", "Description", "Description"]),

          // Divider between tasting and user notes
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Text(
                  "Your notes",
                  style: getFonts(context).ebGaramondSemiBold.copyWith(
                    fontSize: 18.sp,
                    color: getColors(context).whiteColor,
                  ),
                ),
                const Spacer(),
                Icon(Icons.edit, size: 18.sp, color: getColors(context).grey),
              ],
            ),
          ),
          _buildTastingSection("Nose", ["Description", "Description", "Description"]),
          _buildTastingSection("Palate", ["Description", "Description", "Description"]),
          _buildTastingSection("Finish", ["Description", "Description", "Description"]),
        ],
      ),
    );
  }
}
