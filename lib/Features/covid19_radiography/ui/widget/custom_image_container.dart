import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_cubit.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.of,
  });

  final Covid19Cubit of;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6.w,
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: of.imagePicked
          ? ClipRRect(
              borderRadius: BorderRadius.circular(6.w),
              child: Image.file(
                of.selectedImage!,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            )
          : Center(
              child: Text(
                "قم بتحميل أشعة الصدر الخاصة بك هنا",
                style: Styles.style16.copyWith(color: Colors.black),
              ),
            ),
    );
  }
}
