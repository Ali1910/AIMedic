import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_cubit.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_state.dart';
import 'package:gbsub/Features/bmi_medical_record/ui/widgets/Custom_bmi_record_element_body.dart';

class CustomBMIReadElement extends StatelessWidget {
  const CustomBMIReadElement({
    super.key,
    required this.read,
  });

  final BmiReads read;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BmiRecordCubit, BmiRecordState>(
      listener: (context, state) async {
        if (state is DeleteUserReadSucceeded) {
          await BlocProvider.of<BmiRecordCubit>(context)
              .getAllReadsForUser(Sharedhelper.getintdata(intkey));
        }
      },
      child: Container(
        height: 100.h,
        margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(8.w)),
        child: CustomBmiREcoredElementBody(read: read),
      ),
    );
  }
}
