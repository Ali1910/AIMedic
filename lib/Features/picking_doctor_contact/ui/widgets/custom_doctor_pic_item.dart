import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPictureItem extends StatelessWidget {
  const CustomPictureItem({
    super.key,
    required this.pic,
  });
  final String pic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 110.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          pic,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
