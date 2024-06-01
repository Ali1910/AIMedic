import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

import 'package:gbsub/Features/doctor_booking/ui/update_booking/booking_update_view.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_cubit.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/ui/widgets/custom_booking_item_button.dart';

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
            if ((DateTime.now().month >
                int.parse(appointment.month))) //old month
            {
              customSnackBar(context, 'لا يمكن تعديل هذا الميعاد ');
            } else if (DateTime.now().month == int.parse(appointment.month) &&
                int.parse(appointment.day) - DateTime.now().day <
                    0) // same month old day
            {
              customSnackBar(context, 'لا يمكن تعديل هذا الميعاد ');
            } else if (DateTime.now().month == int.parse(appointment.month) &&
                int.parse(appointment.day) - DateTime.now().day ==
                    0) //same month same day
            {
              String hour = appointment.appointmentTime.substring(0, 2);
              if (int.parse(hour) - DateTime.now().hour <=
                  1) //check hour fo one hour diff
              {
                customSnackBar(
                    context, 'لا يمكن تعديل هذا الميعاد نظرا لضيق الوقت');
              } else // more than one hour diff
              {
                await updateFunction(context);
              }
            } else {
              await updateFunction(context);
            }
          },
          text: 'تعديل',
          textcolor: Colors.white,
          buttonColor: mainColor,
        ),
        CustomBookingButton(
          onPressed: () async {
            var of = BlocProvider.of<UpComingAppointmentsCubit>(context);
            bool checker = await of.deleteAppointMents(appointment.id);
            if (checker) {
              await of.fetchAppointments(
                Sharedhelper.getintdata(intkey),
              );
            } else {
              customSnackBar(context, 'لا يمكن حذف هذا الميعاد نظرا لضيق الوقت',
                  duration: 1500);
            }
          },
          text: 'الغاء',
          textcolor: mainColor,
          buttonColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> updateFunction(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookingUpdateView(
          appDataModel: appointment,
        ),
      ),
    );
  }
}
