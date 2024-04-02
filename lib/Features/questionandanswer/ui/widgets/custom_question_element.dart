import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_divider.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/custom_doctor_answer.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/cutom_question_gender.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomQuestionElement extends StatelessWidget {
  const CustomQuestionElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: mainColor.withOpacity(0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomQuestionGender(),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'كيف اتخلص من الزكام في يوم? فأنا طالب ولدي امتحان مهم جدا غدا ',
            style: Styles.styleBold16,
          ),
          SizedBox(
            height: 30.h,
          ),
          const CustomDivider(),
          SizedBox(
            height: 5.h,
          ),
          const CustomDoctorAnswer(),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
