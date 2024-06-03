import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_divider.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_booking_item_doctor_info.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_cubit.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/ui/widgets/custom_buttons_row.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_contact_message_icon.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_doctor_image.dart';

class CustomUpcomingBookingHistoryItem extends StatelessWidget {
  const CustomUpcomingBookingHistoryItem({
    super.key,
    required this.appointmentDateModelDTO,
  });
  final AppointmentDateModelDTO appointmentDateModelDTO;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) async {
            var of = BlocProvider.of<UpComingAppointmentsCubit>(context);
            bool checker =
                await of.deleteAppointMents(appointmentDateModelDTO.id);
            if (checker) {
              await of.fetchAppointments(
                Sharedhelper.getintdata(intkey),
              );
            } else {
              if (context.mounted) {
                customSnackBar(
                    BlocProvider.of<MainCubit>(context)
                        .scaffoldKey
                        .currentContext!,
                    'لا يمكن حذف هذا الميعاد نظرا لضيق الوقت',
                    duration: 1500);
              }
            }
          },
          backgroundColor: Colors.red,
          icon: FontAwesomeIcons.cancel,
          label: "الغاء",
        )
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CutomBookingItemImage(
                  pic: appointmentDateModelDTO.doctorPic,
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
            CustomBookingItemButtonsRow(
              appointment: appointmentDateModelDTO,
            )
          ],
        ),
      ),
    );
  }
}
