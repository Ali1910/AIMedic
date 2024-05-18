import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/body_parts/logic/diagnosis_cubit.dart';
import 'package:gbsub/Features/body_parts/ui/widget/group_card_element.dart';

class DiagnosisViewBody extends StatelessWidget {
  const DiagnosisViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<DiagnosisCubit>(context).getBodyParts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return GroupCardELement(
                      name: BlocProvider.of<DiagnosisCubit>(context)
                          .listofBodyParts[index]
                          .name,
                      id: BlocProvider.of<DiagnosisCubit>(context)
                          .listofBodyParts[index]
                          .id,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5.h,
                    );
                  },
                  itemCount: BlocProvider.of<DiagnosisCubit>(context)
                      .listofBodyParts
                      .length,
                ),
              );
      },
    );
  }
}
