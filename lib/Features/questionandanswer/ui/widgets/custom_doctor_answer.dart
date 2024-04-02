import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomDoctorAnswer extends StatelessWidget {
  const CustomDoctorAnswer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.w),
          child: Image.asset(
            'assets/images/profile.png',
            width: 50.w,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أجاب السؤال',
              style: Styles.style14,
            ),
            Text(
              'دكتور علي هاني علي',
              style: Styles.style14,
            ),
          ],
        ),
        SizedBox(
          width: 15.w,
        ),
        Row(
          children: [
            Text(
              'إجابة السؤال',
              style: Styles.style14.copyWith(color: mainColor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                size: 20.w,
              ),
              color: mainColor,
            )
          ],
        )
      ],
    );
  }
}
