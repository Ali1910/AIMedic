import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_cubit.dart';
import 'package:gbsub/Features/diabetes_preidiction/ui/diabetes_view_body.dart';

class DiabetesView extends StatelessWidget {
  const DiabetesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => DiabetesCubit(),
        child: const Scaffold(
          appBar: CustomAppbar(title: 'تنبؤ مرض السكري'),
          body: DiaBetesViewBody(),
        ),
      ),
    );
  }
}
