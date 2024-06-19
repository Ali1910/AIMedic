import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_cubit.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_states.dart';
import 'package:gbsub/Features/diabetes_preidiction/ui/widgets/custom_input_column.dart';

class DiaBetesViewBody extends StatelessWidget {
  const DiaBetesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<DiabetesCubit>(context);
    return BlocBuilder<DiabetesCubit, DiabetesStates>(
      builder: (context, state) {
        return Form(
          key: of.key,
          autovalidateMode: of.autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomInput(),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Customelevatedbutton(
                          text: 'تنبؤ',
                          onPressed: () async {
                            if (of.key.currentState!.validate()) {
                              BlocProvider.of<DiabetesCubit>(context).predict();
                            } else {
                              of.autovalidateMode = AutovalidateMode.always;
                            }
                          }),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
