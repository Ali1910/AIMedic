import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';

class Custombody extends StatelessWidget {
  const Custombody({
    super.key,
    required this.text,
    required this.widget,
  });
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return widget;
          }));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              text,
              maxLines: 1,
              style: Styles.style15.copyWith(),
            ),
          ),
        ),
      ),
    );
  }
}
