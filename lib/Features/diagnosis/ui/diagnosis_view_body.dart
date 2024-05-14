import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/diagnosis/logic/diagnosis_cubit.dart';
import 'package:gbsub/Features/diagnosis/ui/widget/group_card_element.dart';

class DiagnosisViewBody extends StatelessWidget {
  const DiagnosisViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<DiagnosisCubit>(context).loadData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return GroupCardELement(
                      number: index,
                      index: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount:
                      BlocProvider.of<DiagnosisCubit>(context).listOfDatalength,
                ),
              );
      },
    );
  }
}
