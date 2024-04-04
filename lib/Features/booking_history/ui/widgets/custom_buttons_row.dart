import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_button.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_dialog.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/ui/update_booking/booking_update_view.dart';

class CustomBookingItemButtonsRow extends StatelessWidget {
  const CustomBookingItemButtonsRow({
    super.key,
    required this.appointment,
  });
  final AppointmentDateModelDTO appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomBookingButton(
          onPressed: () async {
            var of = BlocProvider.of<BookingCubit>(context);
            if (DateTime.now().month == int.parse(appointment.month) &&
                int.parse(appointment.day) - DateTime.now().day <= 0) {
              String hour = appointment.appointmentTime.substring(0, 2);
              if (int.parse(hour) - DateTime.now().hour <= 1) {
                customSnackBar(
                    context, 'لا يمكن تعديل هذا الميعاد نظرا لضيق الوقت');
              } else {
                await updateFunction(of, context);
              }
            } else {
              await updateFunction(of, context);
            }
          },
          text: 'تعديل',
          textcolor: Colors.white,
          buttonColor: mainColor,
        ),
        BlocProvider(
          create: (context) => BookingHistroyCubit(dio: Dio()),
          child: CustomBookingButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return Customdialog(appointment: appointment);
                },
              );
            },
            text: 'الغاء',
            textcolor: mainColor,
            buttonColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Future<void> updateFunction(BookingCubit of, BuildContext context) async {
    of.dateTime = DateTime(int.parse(appointment.year),
        int.parse(appointment.month), int.parse(appointment.day));

    await of.getTimesForDoctor(
        doctorid: appointment.dcotorid,
        year: appointment.year,
        day: appointment.day,
        month: appointment.month);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingUpdateView(
          appDataModel: appointment,
        ),
      ),
    );
  }
}
