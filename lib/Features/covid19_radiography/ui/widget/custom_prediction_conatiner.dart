import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_cubit.dart';

class CustomPredictionContainer extends StatelessWidget {
  const CustomPredictionContainer({
    super.key,
    required this.of,
  });

  final Covid19Cubit of;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: mainColor),
      child: Text(
        of.prediction,
        maxLines: 4,
        style: Styles.style16.copyWith(color: Colors.white),
      ),
    );
  }
}
