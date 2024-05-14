import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/diagnosis/logic/diagnosis_cubit.dart';
import 'package:gbsub/Features/diagnosis/ui/diagnosis_view_body.dart';

class DiagnosisView extends StatelessWidget {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiagnosisCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<MainCubit, MainStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'تشخيص',
                  style: Styles.styleBold24.copyWith(
                    color: mainColor,
                  ),
                ),
                iconTheme: IconThemeData(color: mainColor),
              ),
              body: const DiagnosisViewBody(),
            );
          },
        ),
      ),
    );
  }
}
