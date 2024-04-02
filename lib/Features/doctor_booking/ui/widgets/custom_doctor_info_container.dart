import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/custom_info_row_container.dart';

class DoctorInfoContainer extends StatelessWidget {
  const DoctorInfoContainer({
    super.key,
    required this.value1,
    required this.value2,
  });

  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'معلومات',
                  style: Styles.style20,
                ),
                const Spacer(),
                CustomTextRowDoctorInfo(
                  value: value1,
                  text: 'قيمة الحجز',
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                'حاصل على الدكتوراه من  $value2 ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.style14.copyWith(color: Colors.grey.shade500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
