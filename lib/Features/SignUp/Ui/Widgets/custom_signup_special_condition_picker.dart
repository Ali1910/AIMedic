import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_states.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomSignUpSpecialConditionsPickerConatiner extends StatelessWidget {
  const CustomSignUpSpecialConditionsPickerConatiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                    BlocProvider.of<SignUpCubit>(context)
                        .specialdropdownmenuvaluechanged(
                            BlocProvider.of<SignUpCubit>(context)
                                .specialcondtion[index]);

                    print(BlocProvider.of<SignUpCubit>(context).city);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Text(
                      BlocProvider.of<SignUpCubit>(context)
                          .specialcondtion[index],
                      style: Styles.style16,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 10.w,
                  endIndent: 10.w,
                );
              },
              itemCount:
                  BlocProvider.of<SignUpCubit>(context).specialcondtion.length,
            );
          },
        );
      },
      child: BlocBuilder<SignUpCubit, SignUpStates>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            child: Text(
              BlocProvider.of<SignUpCubit>(context).specailCondition,
              style: Styles.style16.copyWith(
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          );
        },
      ),
    );
  }
}
