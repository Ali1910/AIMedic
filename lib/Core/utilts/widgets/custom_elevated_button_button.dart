import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class Customelevatedbutton extends StatelessWidget {
  const Customelevatedbutton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            fixedSize: Size(250.w, 50.h),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.style16.copyWith(color: Colors.white),
          )),
    );
  }
}
