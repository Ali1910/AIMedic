import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';
import 'package:gbsub/Features/done_appointments/logic/Done_appointments_cubit.dart';
import 'package:gbsub/Features/done_appointments/logic/Done_appointments_state.dart';

import 'package:gbsub/Features/done_appointments/ui/widgets/Success_body.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';

class DoneAppointmentsBody extends StatelessWidget {
  const DoneAppointmentsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoneAppointmentsCubit, AppointmentHistory>(
      builder: (context, state) {
        if (state is DoneAppointmentsFetchingFailed) {
          return FailedBody(text: state.failure);
        } else if (state is DoneAppointmentsFetchingSucceeded) {
          return state.response.isEmpty
              ? const ScuccesEmptyBody(
                  text: 'لا توجد حجوزات ملغية',
                )
              : DoneSuccessBody(
                  appointmentDateModelDTO: state.response,
                );
        } else {
          return const LoadingBody();
        }
      },
    );
  }
}
