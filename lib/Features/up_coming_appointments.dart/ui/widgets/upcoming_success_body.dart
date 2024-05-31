import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

import 'package:gbsub/Features/up_coming_appointments.dart/ui/widgets/upcoming_item.dart';

class UpcomingSucessBody extends StatelessWidget {
  const UpcomingSucessBody({
    super.key,
    required this.appointmentDateModelDTO,
  });
  final List<AppointmentDateModelDTO> appointmentDateModelDTO;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        itemCount: appointmentDateModelDTO.length,
        itemBuilder: (context, index) {
          return CustomUpcomingBookingHistoryItem(
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
