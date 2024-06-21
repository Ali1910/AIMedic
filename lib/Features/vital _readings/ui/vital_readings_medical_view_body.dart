import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gbsub/Features/vital%20_readings/data/data.dart';
import 'package:gbsub/Features/vital%20_readings/ui/widgets/custom_vital_elemnt.dart';

class VitalReadingsViewBody extends StatelessWidget {
  const VitalReadingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: ListView.separated(
          itemCount: data['Reads'].length,
          itemBuilder: (context, index) {
            return CustomVitalElement(
              blooadpressure: data["Reads"][index][0].toString(),
              temp: data["Reads"][index][1].toString(),
              oxgenRate: data["Reads"][index][2].toString(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10.h,
            );
          },
        ),
      ),
    );
  }
}
