import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/assets/app_assets.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/strings/app_string.dart';
import '../../widgets/base/base_stateless_widget.dart';

class WelcomePage extends BaseStatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.foregroundPathernImage,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.w), // Responsive padding
              margin: EdgeInsets.all( 16.w), // Reduced margin
              constraints: BoxConstraints(
                maxWidth: 400.w, // Added maximum width constraint
              ),
              decoration: BoxDecoration(
                color: getColors(context).boxColors,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.welcomeText,
                    style: getFonts(context).ebGaramondBold?.copyWith(
                      fontSize: 20.sp, // Slightly reduced font size
                      color: getColors(context).whiteColor,
                    ),
                    textAlign: TextAlign.center, // Added text alignment
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w), // Inner padding
                    child: Text(
                      AppStrings.textTextText,
                      style: getFonts(context).ebGaramondRegular?.copyWith(
                        color: getColors(context).whiteColor.withOpacity(0.7),
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity, // Make button full width
                    child: ElevatedButton(
                      onPressed: () => context.push('/camera'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getColors(context).yellowColor,
                        foregroundColor: getColors(context).blackColor,
                        minimumSize: Size.fromHeight(48.h),
                        textStyle: getFonts(context).ebGaramondSemiBold?.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      child: const Text('Scan bottle'),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Flexible( // Wrapped with Flexible
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible( // Added Flexible for text
                            child: Text(
                              "Have an account?",
                              style: getFonts(context).ebGaramondRegular?.copyWith(
                                color: getColors(context).whiteColor.withOpacity(0.7),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/sign-in'),
                            child: Text(
                              'Sign in first',
                              style: getFonts(context).ebGaramondMedium?.copyWith(
                                color: getColors(context).yellowColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}