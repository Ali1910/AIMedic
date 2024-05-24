import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/picking_doctor_booking/logic/get_doctor_by_speciality.dart';
import 'package:gbsub/Features/picking_doctor_booking/ui/picking_doctor_view_body.dart';
import 'package:gbsub/Features/search_for_doctor/ui/search_for_doctor_view.dart';

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
          appBar: CustomAppbar(
            title: 'قائمة الأطباء',
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchView(
                            spec: spec,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            child: PickingDoctorViewBody(
              spec: spec,
            ),
          ),
        ),
      ),
    );
  }
}
