import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomBookingButton extends StatelessWidget {
  const CustomBookingButton({
    super.key,
    required this.text,
    required this.textcolor,
    required this.buttonColor,
    this.onPressed,
  });
  final String text;
  final Color textcolor;
  final Color buttonColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        side: BorderSide(color: mainColor),
        minimumSize: Size(148.w, 38.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.style13.copyWith(
          color: textcolor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
