import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/search_cubit.dart';

class CustomSearchTextFormFeild extends StatelessWidget {
  const CustomSearchTextFormFeild({
    super.key,
    required this.spec,
  });
  final String spec;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: TextFormField(
          autofocus: true,
          onChanged: (value) async {
            if (value.isNotEmpty) {
              await BlocProvider.of<SearchCubit>(context)
                  .getdoctors(value, spec);
            } else {}
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'هذا الحقل لا يمكن ان يكون فارغ';
            }
          },
          decoration: InputDecoration(
            hintText: 'أدخل اسم الطبيب',
            hintStyle: Styles.style11.copyWith(color: Colors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: Styles.borderStyle(
              Colors.grey.withOpacity(0.5),
            ),
            focusedBorder: Styles.borderStyle(
              mainColor.withOpacity(0.7),
            ),
          )),
    );
  }
}
