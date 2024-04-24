import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomPersonalDetailsContiner extends StatelessWidget {
  const CustomPersonalDetailsContiner({
    super.key,
    required this.title,
    required this.data,
    this.onPressed,
    required this.updated,
  });
  final String title;
  final String data;
  final void Function()? onPressed;
  final bool updated;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.styleBold16.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                data,
                style: Styles.styleBold16.copyWith(color: Colors.grey),
              ),
            ],
          ),
          updated
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    FontAwesomeIcons.edit,
                    color: mainColor,
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}
