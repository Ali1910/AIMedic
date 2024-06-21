import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';
import 'package:gbsub/Features/canceled_appointments/logic/canceled_appointments_cubit.dart';
import 'package:gbsub/Features/canceled_appointments/logic/canceled_appointments_state.dart';
import 'package:gbsub/Features/canceled_appointments/ui/widgets/success_body.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';

class CanceledAppointmentsBody extends StatelessWidget {
  const CanceledAppointmentsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanceledAppointmentsCubit, AppointmentHistory>(
      builder: (context, state) {
        if (state is CanceledAppointmentsFetchingFailed) {
          return FailedBody(text: state.failure);
        } else if (state is CanceledAppointmentsFetchingSucceeded) {
          return state.response.isEmpty
              ? const ScuccesEmptyBody(
                  text: 'لا توجد حجوزات ملغية',
                )
              : CanceledSuccessBody(
                  appointmentDateModelDTO: state.response,
                );
        } else {
          return const LoadingBody();
        }
      },
    );
  }
}
