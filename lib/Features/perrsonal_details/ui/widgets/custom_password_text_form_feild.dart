import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/perrsonal_details/logic/personal_details_cubit.dart';

class CutomUpdatePasswordTextFormFeild extends StatelessWidget {
  const CutomUpdatePasswordTextFormFeild({
    super.key,
    required this.of,
    required this.onFieldSubmitted,
    required this.onChanged,
    required this.validator,
    required this.hinttext,
  });

  final PersonalDetailsCubit of;
  final void Function(String p1)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: hinttext,
        hintStyle: Styles.style14.copyWith(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: BorderSide(color: mainColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
