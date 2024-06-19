import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/medical_advices/data/medical_advice_model.dart';
import 'package:gbsub/Features/medical_advices/ui/widgets/custom.doctor_info.dart';
import 'custom_content_element.dart';
import 'custom_image_element.dart';

class CustomHealthAdviceItem extends StatelessWidget {
  const CustomHealthAdviceItem({
    super.key,
    required this.healthAdviceModel,
  });
  final HealthAdviceModel healthAdviceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: mainColor.withOpacity(
              0.3,
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomImageElement(
                image: '$imageUrl${healthAdviceModel.doctor.doctorPic}',
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomDoctorInfo(
                doctorName: healthAdviceModel.doctor.doctorName,
                spec: healthAdviceModel.speciality.spec,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomContentElement(
            content: healthAdviceModel.healthAdvice.content,
          ),
        ],
      ),
    );
  }
}
