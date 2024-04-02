import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_upper_body_child.dart';

class CustomUpperbodyShape extends StatelessWidget {
  const CustomUpperbodyShape({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: ShapeDecoration(
        color: mainColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.w),
            bottomRight: Radius.circular(15.w),
          ),
        ),
      ),
      child: Transform.translate(
        offset: Offset(0, 80.h),
        child: Center(
          child: CustomDoctorNameContainer(name: name),
        ),
      ),
    );
  }
}
