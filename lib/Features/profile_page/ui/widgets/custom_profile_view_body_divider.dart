import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.h),
      child: SizedBox(
        height: 5.h,
        child: Divider(
          indent: 24.w,
          endIndent: 24.w,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
