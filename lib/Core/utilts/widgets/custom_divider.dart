import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookingHistoryDivider extends StatelessWidget {
  const CustomBookingHistoryDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Divider(
        color: const Color(0xff616161),
        indent: 20.w,
        endIndent: 20.w,
      ),
    );
  }
}
