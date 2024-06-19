import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_divider.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_doctor_info.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_contact_message_icon.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_doctor_image.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/custom_rating_item.dart';

class CustomDoneBookingHistoryItem extends StatelessWidget {
  const CustomDoneBookingHistoryItem({
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
          appointmentDateModelDTO.rated
              ? Center(
                  child: Text(
                    'تم التقييم',
                    style: Styles.style16.copyWith(color: mainColor),
                  ),
                )
              : Customelevatedbutton(
                  text: 'تقييم',
                  height: 40,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return CustomRating(
                          appointmentDataModel: appointmentDateModelDTO,
                        );
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
