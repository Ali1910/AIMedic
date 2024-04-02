import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomDoctorsDetailsItem extends StatelessWidget {
  const CustomDoctorsDetailsItem({
    super.key,
    required this.name,
    required this.univ,
    required this.fee,
  });
  final String name;
  final String univ;
  final int fee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 10.h, start: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'دكتور $name',
            style: Styles.style16,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'عام | $univ',
            style: Styles.style16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'سعر الكشف : $fee جنيه',
            style: Styles.style16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
