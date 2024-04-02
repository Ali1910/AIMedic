import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_booking_elevated_button.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_date_picker.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_doctor_info_container.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_time_item_list_view.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_upper_body.dart';
import 'package:gbsub/Features/picking_doctor/data/doctor_data_model.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({
    super.key,
    required this.doctorDataModel,
  });
  final DoctorDataModel doctorDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUpperbodyShape(name: doctorDataModel.name),
          SizedBox(
            height: 50.h,
          ),
          DoctorInfoContainer(
            value1: '${doctorDataModel.fee} جنيه',
            value2: doctorDataModel.university,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            ' المواعيد ',
            style: Styles.style20.copyWith(),
          ),
          CustomDatePicker(
            doctorid: doctorDataModel.id,
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
          const CustomBookingElevatedbuttom(),
        ],
      ),
    );
  }
}
