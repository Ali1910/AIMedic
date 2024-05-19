import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_cubit.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_states.dart';

class DiaBetesViewBody extends StatelessWidget {
  const DiaBetesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<DiabetesCubit, DiabetesStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 4,
              ),
              Container(
                width: double.infinity,
                height: 120.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.w),
                    side: BorderSide(color: mainColor),
                  ),
                ),
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'نسبة الجلوكوز في الدم',
                      style: Styles.styleBold16.copyWith(color: mainColor),
                    ),
                    Slider(
                      inactiveColor: Colors.grey.withOpacity(0.5),
                      secondaryActiveColor: Colors.grey.withOpacity(0.1),
                      activeColor: mainColor,
                      value: BlocProvider.of<DiabetesCubit>(context)
                          .sliderInitialValue,
                      secondaryTrackValue: 120,
                      onChanged: (v) {
                        BlocProvider.of<DiabetesCubit>(context)
                            .sliderValueChanged(v);
                      },
                      min: 70,
                      max: 180,
                    ),
                    Text(
                      '${BlocProvider.of<DiabetesCubit>(context).sliderInitialValue.toInt()}',
                      style: Styles.style16.copyWith(color: mainColor),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                        side: BorderSide(color: mainColor),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.scaleBalanced,
                          color: mainColor,
                          size: 25.w,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          scrollPadding: EdgeInsets.all(5.w),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.w),
                              borderSide: BorderSide(color: mainColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.w),
                              borderSide: BorderSide(color: mainColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'BMI',
                          style: Styles.styleBold16.copyWith(color: mainColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w),
                        side: BorderSide(color: mainColor),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.droplet,
                          color: mainColor,
                          size: 25.w,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          scrollPadding: EdgeInsets.all(5.w),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.w),
                              borderSide: BorderSide(color: mainColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.w),
                              borderSide: BorderSide(color: mainColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'ضغط الدم',
                          style: Styles.styleBold16.copyWith(color: mainColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 4,
              )
            ],
          );
        },
      ),
    );
  }
}
