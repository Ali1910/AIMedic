import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
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
        '!تاكيد حذف الميعاد',
        textAlign: TextAlign.center,
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
            // var of = BlocProvider.of<BookingHistroyCubit>(context);
            // bool checker = await of.deleteAppointments(appointment.id);
            // if (checker) {
            //   // Navigator.of(context).pop(await of.getAppointMents(
            //   //     Sharedhelper.getintdata(intkey), false));
            //   // var of2 = BlocProvider.of<BookingCubit>(context);
            //   // await of2.getTimesForDoctor(
            //   //     doctorid: appointment.dcotorid,
            //   //     year: of2.year,
            //   //     day: of2.day,
            //   //     month: of2.month);
            //   Navigator.of(context).pop();
            // } else {
            //   customSnackBar(context, 'لا يمكن حذف هذا الميعاد نظرا لضيق الوقت',
            //       duration: 1500);
            //   Navigator.of(context).pop();
            // }
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
