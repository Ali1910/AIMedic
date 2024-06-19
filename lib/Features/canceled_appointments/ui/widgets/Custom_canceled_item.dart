import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_doctor_info.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_contact_message_icon.dart';
import 'package:gbsub/Core/utilts/widgets/custom_divider.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_doctor_image.dart';

class CustomCanceledItem extends StatelessWidget {
  const CustomCanceledItem({
    super.key,
    required this.appointmentDateModelDTO,
  });
  final AppointmentDateModelDTO appointmentDateModelDTO;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CutomBookingItemImage(
                pic: "$imageUrl${appointmentDateModelDTO.doctorPic}",
              ),
              CustomBookingItemDoctorInformations(
                  name: appointmentDateModelDTO.doctorName,
                  month: appointmentDateModelDTO.month,
                  day: appointmentDateModelDTO.day,
                  year: appointmentDateModelDTO.year,
                  spec: appointmentDateModelDTO.doctorSpec,
                  datatime: appointmentDateModelDTO.appointmentTime),
              const CustomConatctMessageIcon()
            ],
          ),
          const CustomBookingHistoryDivider(),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              'تم الالغاء',
              style: Styles.style16.copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
