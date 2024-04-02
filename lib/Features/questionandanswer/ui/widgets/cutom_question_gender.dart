import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomQuestionGender extends StatelessWidget {
  const CustomQuestionGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'سؤال من :',
          style: Styles.style16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          'ذكر',
          style: Styles.style16.copyWith(color: mainColor),
        )
      ],
    );
  }
}
