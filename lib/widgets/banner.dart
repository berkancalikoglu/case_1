import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/strings.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: const DecorationImage(
          image: AssetImage('assets/banner.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                AppStrings.saveExtra1,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: const Color(0xFF1987FB), fontSize: 14.h),
              ),
            ),
            Text(
              AppStrings.saveExtra2,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: const Color(0xFF1987FB), fontSize: 14.h),
            ),
            SizedBox(height: 8.h),
            Text(
              AppStrings.bannerSubtitle1,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color.fromRGBO(9, 15, 71, 0.65),
                  ),
            ),
            Text(
              AppStrings.bannerSubtitle2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color.fromRGBO(9, 15, 71, 0.65),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
