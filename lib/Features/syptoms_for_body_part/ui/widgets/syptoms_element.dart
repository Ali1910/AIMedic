import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_states.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomSyptomElement extends StatelessWidget {
  const CustomSyptomElement({
    super.key,
    required this.name,
    required this.index,
  });
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyptomsCubit, SyptomsStates>(
      builder: (context, state) {
        return Card(
          elevation: 0.2,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListTile(
            leading: Text(
              name,
              style: Styles.style20.copyWith(
                color: mainColor,
              ),
            ),
            trailing: Checkbox(
              value: BlocProvider.of<SyptomsCubit>(context).listOfBools[index],
              onChanged: (b) {
                BlocProvider.of<SyptomsCubit>(context).chageBool(index);
              },
              activeColor: mainColor,
            ),
          ),
        );
      },
    );
  }
}
