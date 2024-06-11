import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomDiabetesPredictionFormFeild extends StatelessWidget {
  const CustomDiabetesPredictionFormFeild({
    super.key,
    required this.hint,
    this.onChanged,
    this.validator,
    required this.label,
  });
  final String hint;
  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: Styles.style16.copyWith(color: Colors.grey.shade400),
          hintStyle: Styles.style16.copyWith(color: Colors.grey.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.w),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.w),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
