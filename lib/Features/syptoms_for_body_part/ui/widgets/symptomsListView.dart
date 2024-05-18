import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms_for_body_part/ui/widgets/syptoms_element.dart';

class SyptomsListView extends StatelessWidget {
  const SyptomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return CustomSyptomElement(
          name:
              BlocProvider.of<SyptomsCubit>(context).listOfSymptoms[index].name,
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 5.h,
        );
      },
      itemCount: BlocProvider.of<SyptomsCubit>(context).listOfSymptoms.length,
    );
  }
}
