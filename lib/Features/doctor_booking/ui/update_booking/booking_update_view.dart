import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/doctor_booking/ui/update_booking/booking_update_view_body.dart';

class BookingUpdateView extends StatelessWidget {
  const BookingUpdateView({super.key, required this.appDataModel});
  final AppointmentDateModelDTO appDataModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor.withOpacity(0.5),
            iconTheme: IconThemeData(color: mainColor),
          ),
          body: BookingUpdateViewBody(
            appDataModel: appDataModel,
          ),
        ),
      ),
    );
  }
}
