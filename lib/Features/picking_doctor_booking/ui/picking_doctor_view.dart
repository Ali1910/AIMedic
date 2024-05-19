import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/picking_doctor_booking/logic/get_doctor_by_speciality.dart';
import 'package:gbsub/Features/picking_doctor_booking/ui/picking_doctor_view_body.dart';

class PickingDoctorBookingView extends StatelessWidget {
  const PickingDoctorBookingView({super.key, required this.spec});
  final String spec;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const CustomAppbar(title: 'قائمة الأطباء'),
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: PickingDoctorViewBody(
              spec: spec,
            ),
          ),
        ),
      ),
    );
  }
}
