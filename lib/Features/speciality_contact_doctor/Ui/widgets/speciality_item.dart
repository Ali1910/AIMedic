import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/picking_doctor_contact/ui/picking_doctor_view.dart';
import 'package:gbsub/Features/speciality_contact_doctor/Data/speciality_data.dart';

class SpecialityItem extends StatelessWidget {
  const SpecialityItem({
    super.key,
    required this.index,
    required this.spec,
  });
  final int index;
  final String spec;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PickingDoctorContactView(
                spec: spec,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.w,
            backgroundColor: mainColor.withOpacity(0.1),
            child: Image.asset(
              'assets/images/specialty/${SpecData.data['image'][index]}',
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            SpecData.data['title'][index],
            style: Styles.style14,
          )
        ],
      ),
    );
  }
}
