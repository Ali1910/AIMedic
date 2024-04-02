import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_button.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_dialog.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/ui/update_booking/booking_update_view.dart';

class CustomBokkingItemButtonsRow extends StatelessWidget {
  const CustomBokkingItemButtonsRow({
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
            of.dateTime = DateTime(int.parse(appointment.year),
                int.parse(appointment.month), int.parse(appointment.day));
            of.yourApp = appointment.appointmentTime;
            await of.getTimesForUpdateDoctor(
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
}
