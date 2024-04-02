import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class QuestionUpperBody extends StatelessWidget {
  const QuestionUpperBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [mainColor.withOpacity(0.15), Colors.white.withOpacity(1)],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
          stops: const [1, 1],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'أسئلة وأجوبة',
            textAlign: TextAlign.center,
            style: Styles.style24.copyWith(color: mainColor),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              'أدخل سؤالك الأن',
              style: Styles.style16.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
