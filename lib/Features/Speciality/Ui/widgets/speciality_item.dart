import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/Speciality/Data/speciality_data.dart';
import 'package:gbsub/Features/picking_doctor/ui/picking_doctor_view.dart';

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
              return PickingDcotroView(
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
            height: 15.h,
          ),
          Text(
            SpecData.data['title'][index],
            style: Styles.style16,
          )
        ],
      ),
    );
  }
}
