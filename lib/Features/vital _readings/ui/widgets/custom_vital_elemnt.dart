import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/vital%20_readings/ui/widgets/custom_read_row.dart';

class CustomVitalElement extends StatelessWidget {
  const CustomVitalElement({
    super.key,
    required this.blooadpressure,
    required this.temp,
    required this.oxgenRate,
  });
  final String blooadpressure;
  final String temp;
  final String oxgenRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
      decoration: ShapeDecoration(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomReadRow(
            read: 'ضغط الدم',
            value: blooadpressure,
          ),
          CustomReadRow(
            read: 'درجة الحرارة',
            value: temp,
          ),
          CustomReadRow(
            read: 'نسبة الأكسجين',
            value: oxgenRate,
          )
        ],
      ),
    );
  }
}
