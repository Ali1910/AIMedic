import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_cubit.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_state.dart';
import 'package:gbsub/Features/bmi_medical_record/ui/widgets/custmo_bmi_success_reads.dart';

class BMIMedicalRecordBody extends StatelessWidget {
  const BMIMedicalRecordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiRecordCubit, BmiRecordState>(
      builder: (context, state) {
        if (state is DeleteUserReadFailed) {
          return FailedBody(
            text: state.error,
          );
        } else if (state is GetUserReadsFailed) {
          return FailedBody(
            text: state.error,
          );
        } else if (state is GetUserReadsSucceeded) {
          return state.reads.isNotEmpty
              ? BMiGetreadsSuccessBody(
                  reads: state.reads,
                )
              : const ScuccesEmptyBody(
                  text: 'لا توجد قراءات أستخدم الحاسبة الخاصة بنا');
        } else {
          return const LoadingBody();
        }
      },
    );
  }
}
