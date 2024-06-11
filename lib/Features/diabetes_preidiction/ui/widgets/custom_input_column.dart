import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_cubit.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/validation_function.dart';
import 'package:gbsub/Features/diabetes_preidiction/ui/widgets/custom_text_form_feild.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<DiabetesCubit>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.h,
        ),
        CustomDiabetesPredictionFormFeild(
          label: 'جلوكوز',
          hint: '70:180',
          onChanged: (p0) {
            of.onchageglucose(p0);
          },
          validator: (p0) {
            return validation(p0);
          },
        ),
        CustomDiabetesPredictionFormFeild(
          label: 'BMI',
          hint: '15:35',
          onChanged: (p0) {
            of.onchagebmi(p0);
          },
          validator: (p0) {
            return validation(p0);
          },
        ),
        CustomDiabetesPredictionFormFeild(
          hint: "60:120",
          label: 'ضغط الدم ',
          onChanged: (p0) {
            of.onchagebloodpressure(p0);
          },
          validator: (p0) {
            return validation(p0);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        of.predicted
            ? Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: mainColor),
                child: Center(
                  child: Text(
                    of.prediction,
                    style: Styles.style16.copyWith(color: Colors.white),
                  ),
                ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              )
      ],
    );
  }
}
