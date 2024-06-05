import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomDoneAppointmentRatingTextFormFeild extends StatelessWidget {
  const CustomDoneAppointmentRatingTextFormFeild({
    super.key,
    required this.label,
    this.validator,
    this.onChanged,
    this.maxlines = 1,
  });
  final String label;
  final int? maxlines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: Styles.style14.copyWith(color: Colors.grey.shade600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor),
            borderRadius: BorderRadius.circular(16.w),
          ),
        ),
      ),
    );
  }
}
