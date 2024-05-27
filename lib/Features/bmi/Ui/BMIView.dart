import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';

import 'package:gbsub/Features/bmi/Ui/BMIViewBody.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/bmi/logic/cubit/bmi_cubit.dart';
import 'package:gbsub/Features/bmi/logic/repo/dmir_repo_implimentatio.dart';

class BmiView extends StatelessWidget {
  const BmiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => BmiCubit(
          BMIRepoImpl(
            aPiService: APiService(
              Dio(),
            ),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppbar(title: 'حاسبة معدل كتلة الجسم'),
          body: BmiViewBody(),
        ),
      ),
    );
  }
}
