import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_cubit.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_state.dart';
import 'package:gbsub/Features/covid19_radiography/ui/widget/custom_buttons_row.dart';
import 'package:gbsub/Features/covid19_radiography/ui/widget/custom_image_container.dart';
import 'package:gbsub/Features/covid19_radiography/ui/widget/custom_prediction_conatiner.dart';

class Covid19ViewBody extends StatelessWidget {
  const Covid19ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<Covid19Cubit>(context);
    return BlocBuilder<Covid19Cubit, Covid19State>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<Covid19Cubit, Covid19State>(
                builder: (context, state) {
                  return CustomImageContainer(of: of);
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              of.predicted
                  ? CustomPredictionContainer(of: of)
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              SizedBox(
                height: 10.h,
              ),
              CustomButtonsRow(of: of)
            ],
          ),
        );
      },
    );
  }
}
