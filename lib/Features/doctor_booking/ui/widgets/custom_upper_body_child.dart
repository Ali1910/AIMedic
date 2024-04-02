import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomDoctorNameContainer extends StatelessWidget {
  const CustomDoctorNameContainer({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      width: 300.w,
      height: 80.h,
      decoration: ShapeDecoration(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.w),
        ),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.start,
          ' دكتور :$name ',
          style: Styles.styleBold24.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
