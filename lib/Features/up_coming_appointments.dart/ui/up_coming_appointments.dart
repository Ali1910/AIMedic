import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_cubit.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/ui/widgets/upcoming_success_body.dart';

class UpComingAppointmentsBody extends StatelessWidget {
  const UpComingAppointmentsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingAppointmentsCubit, AppointmentHistory>(
      builder: (context, state) {
        if (state is UpComingAppointmentsFetchingFailed) {
          return FailedBody(text: state.failure);
        } else if (state is UpComingAppointmentsFetchingSucceeded) {
          return state.response.isEmpty
              ? const ScuccesEmptyBody(
                  text: 'لا توجد حجوزات ',
                )
              : UpcomingSucessBody(
                  appointmentDateModelDTO: state.response,
                );
        } else {
          return const LoadingBody();
        }
      },
    );
  }
}
