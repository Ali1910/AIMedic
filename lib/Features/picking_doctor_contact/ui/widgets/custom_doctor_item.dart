import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/whatsapp.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/picking_doctor_contact/data/doctor_data_model.dart';
import 'package:gbsub/Features/picking_doctor_contact/ui/widgets/custom_doctor_detials_item.dart';
import 'package:gbsub/Features/picking_doctor_contact/ui/widgets/custom_doctor_pic_item.dart';

class CustomDoctorItem extends StatelessWidget {
  const CustomDoctorItem({
    super.key,
    required this.doctorDataModel,
  });
  final DoctorDataModel doctorDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPictureItem(
              pic: doctorDataModel.pic,
            ),
            CustomDoctorsDetailsItem(
              name: doctorDataModel.name,
              univ: doctorDataModel.university,
              fee: doctorDataModel.fee,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Customelevatedbutton(
              text: 'تواصل',
              onPressed: () {
                launchWhatsApp(
                    context: context,
                    name: doctorDataModel.name,
                    phoneNumder: doctorDataModel.phoneNumber);
              }),
        )
      ],
    );
  }
}
