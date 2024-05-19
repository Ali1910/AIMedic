import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class CustomImageElement extends StatelessWidget {
  const CustomImageElement({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60.w),
      child: Image.network(
        '$imageUrl$image',
        width: 60.w,
        height: 60.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
