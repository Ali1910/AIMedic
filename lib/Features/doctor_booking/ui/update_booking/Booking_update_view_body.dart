import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_date_picker_for_update.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_doctor_info_container.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_time_item_list_view.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_updating_elevated_button.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_upper_body.dart';

class BookingUpdateViewBody extends StatelessWidget {
  const BookingUpdateViewBody({
    super.key,
    required this.appDataModel,
  });
  final AppointmentDateModelDTO appDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUpperbodyShape(name: appDataModel.doctorName),
          SizedBox(
            height: 50.h,
          ),
          DoctorInfoContainer(
            value1: '${appDataModel.fee} جنيه',
            value2: appDataModel.univ,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            ' المواعيد ',
            style: Styles.style20.copyWith(),
          ),
          CustomDatePickerForUpdate(
            doctorid: appDataModel.dcotorid,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            ' الأوقات المتاحة ',
            style: Styles.style20,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomTimesListView(),
          SizedBox(
            height: 20.h,
          ),
          CustomUpdatingElevatedbuttom(
            appointmentDateModelDTO: appDataModel,
          ),
        ],
      ),
    );
  }
}
