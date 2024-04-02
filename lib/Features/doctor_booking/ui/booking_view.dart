import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/doctor_booking/ui/booking_view_body.dart';
import 'package:gbsub/Features/picking_doctor/data/doctor_data_model.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.doctorDataModel});
  final DoctorDataModel doctorDataModel;

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
          body: BookingViewBody(
            doctorDataModel: doctorDataModel,
          ),
        ),
      ),
    );
  }
}
