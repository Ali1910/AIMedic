import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_states.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomSignUpDatePickerConatiner extends StatelessWidget {
  const CustomSignUpDatePickerConatiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? datetime = await (showDatePicker(
          context: context,
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        ));
        BlocProvider.of<SignUpCubit>(context)
            .datepickedfunc(datetime ?? DateTime.now());
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
              BlocProvider.of<SignUpCubit>(context).dateformatted,
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
