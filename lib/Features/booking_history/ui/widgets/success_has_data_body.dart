import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/appointment_item.dart';

class SucessBody extends StatelessWidget {
  const SucessBody({
    super.key,
    required this.appointmentDateModelDTO,
  });
  final List<AppointmentDateModelDTO> appointmentDateModelDTO;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: appointmentDateModelDTO.length,
              itemBuilder: (context, index) {
                return CustomBookingHistoryItem(
                  appointmentDateModelDTO: appointmentDateModelDTO[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
