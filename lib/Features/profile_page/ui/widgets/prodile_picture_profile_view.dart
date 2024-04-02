import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class CustomProfilePictuteProfileView extends StatelessWidget {
  const CustomProfilePictuteProfileView({
    super.key,
    required this.pic,
  });
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60.w),
          child: Image.network(
            'https://10.0.2.2:7093/Resources/$pic',
            fit: BoxFit.fill,
            width: 120.w,
            height: 120.w,
          ),
        ),
        Positioned(
          top: 95.h,
          left: 90.w,
          child: CircleAvatar(
            radius: 12.w,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.edit_outlined,
              size: 20,
              color: mainColor,
            ),
          ),
        ),
      ]),
    );
  }
}
