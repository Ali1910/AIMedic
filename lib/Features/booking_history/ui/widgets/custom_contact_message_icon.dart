import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class CustomConatctMessageIcon extends StatelessWidget {
  const CustomConatctMessageIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(bottom: 10.h),
      onPressed: () {},
      icon: const Icon(Icons.message_outlined),
      color: mainColor,
    );
  }
}
