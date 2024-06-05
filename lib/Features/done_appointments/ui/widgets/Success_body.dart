import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/done_appointment_irem.dart';

class DoneSuccessBody extends StatelessWidget {
  const DoneSuccessBody({super.key, required this.appointmentDateModelDTO});
  final List<AppointmentDateModelDTO> appointmentDateModelDTO;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.separated(
        itemCount: appointmentDateModelDTO.length,
        itemBuilder: (context, index) {
          return CustomDoneBookingHistoryItem(
            appointmentDateModelDTO: appointmentDateModelDTO[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20.h,
          );
        },
      ),
    );
  }
}
