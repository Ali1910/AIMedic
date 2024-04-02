import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/core/utilts/style.dart';

class Customdialog extends StatelessWidget {
  const Customdialog({
    super.key,
    required this.appointment,
  });

  final AppointmentDateModelDTO appointment;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'حذف الميعاد',
        style: Styles.styleBold16,
        textAlign: TextAlign.center,
      ),
      content: Text(
        'تاكيد حذف الميعاد',
        textAlign: TextAlign.start,
        style: Styles.style14,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'لا',
            style: Styles.style14,
          ),
        ),
        TextButton(
          onPressed: () async {
            await BlocProvider.of<BookingHistroyCubit>(context)
                .deleteAppointments(appointment.id);
            Navigator.of(context).pop(
                await BlocProvider.of<BookingHistroyCubit>(context)
                    .getAppointMents(Sharedhelper.getintdata(intkey), false));
            await BlocProvider.of<BookingCubit>(context).getTimesForDoctor(
                doctorid: appointment.dcotorid,
                year: appointment.year,
                day: appointment.day,
                month: appointment.month);
          },
          child: Text(
            'نعم',
            style: Styles.style14,
          ),
        ),
      ],
    );
  }
}
