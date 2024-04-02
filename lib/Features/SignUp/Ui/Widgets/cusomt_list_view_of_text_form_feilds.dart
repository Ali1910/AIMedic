import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/custom_signup_text_form_feild.dart';

class CustomListViewOfTextForm extends StatelessWidget {
  const CustomListViewOfTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<SignUpCubit>(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CustomSignUpTextFormFeild(
          hint: of.listOfRequiredDetails[index],
          onSaved: (p) {
            BlocProvider.of<SignUpCubit>(context).onsaved(p!, index);
          },
          onChanged: (p) {
            BlocProvider.of<SignUpCubit>(context).validationchage();
            BlocProvider.of<SignUpCubit>(context).onsaved(p, index);
          },
          validator: (p) {
            if (p?.isEmpty ?? true) {
              return 'من فضللك قم بادخال هذا البيان';
            } else {
              return null;
            }
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10.h,
        );
      },
      itemCount: of.listOfRequiredDetails.length,
    );
  }
}
