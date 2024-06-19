import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_states.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomSyptomElement extends StatelessWidget {
  const CustomSyptomElement({
    super.key,
    required this.name,
    required this.index,
    required this.ename,
  });
  final String name;
  final int index;
  final String ename;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyptomsCubit, SyptomsStates>(
      builder: (context, state) {
        return Card(
          elevation: 0.2,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListTile(
            leading: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                maxLines: 3,
                name,
                style: Styles.style16.copyWith(
                  color: mainColor,
                ),
              ),
            ),
            trailing: Checkbox(
              value: BlocProvider.of<SyptomsCubit>(context).listOfBools[index],
              onChanged: (b) {
                BlocProvider.of<SyptomsCubit>(context).chageBool(index, ename);
              },
              activeColor: mainColor,
            ),
          ),
        );
      },
    );
  }
}
