import 'package:flutter/material.dart';
import 'package:gbsub/Features/picking_doctor/data/doctor_data_model.dart';
import 'package:gbsub/Features/picking_doctor/ui/widgets/custom_doctor_detials_item.dart';
import 'package:gbsub/Features/picking_doctor/ui/widgets/custom_doctor_pic_item.dart';

class CustomDoctorItem extends StatelessWidget {
  const CustomDoctorItem({
    super.key,
    required this.doctorDataModel,
  });
  final DoctorDataModel doctorDataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
