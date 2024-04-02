import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/picking_doctor/logic/get_doctor_by_speciality.dart';
import 'package:gbsub/Features/picking_doctor/ui/picking_doctor_view_body.dart';

class PickingDcotroView extends StatelessWidget {
  const PickingDcotroView({super.key, required this.spec});
  final String spec;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: mainColor),
            title: Text(
              'قائمة الأطباء',
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          ),
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
