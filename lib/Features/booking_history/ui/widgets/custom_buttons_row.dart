import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_button.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_dialog.dart';

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
          onPressed: () {},
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
