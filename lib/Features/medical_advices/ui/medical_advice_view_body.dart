import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/medical_advices/logic/health_advice_cubit.dart';
import 'package:gbsub/Features/medical_advices/ui/widgets/custom_health_advice_item.dart';

class MedicalViewBody extends StatelessWidget {
  const MedicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<HealthAdviceCubit>(context).getAdvices(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return CustomHealthAdviceItem(
              healthAdviceModel: snapshot.data[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.h,
            );
          },
          itemCount:
              BlocProvider.of<HealthAdviceCubit>(context).healthAdvices.length,
        );
      },
    );
  }
}
