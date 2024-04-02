import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_view.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/cutom_row_conatiner_text.dart';

class CustomProfileRowContainer extends StatelessWidget {
  const CustomProfileRowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const BookingHistoryView();
                  },
                ),
              );
            },
            child: const CustomProfileViewRowText(
              text: 'سجل الحجوزات',
            ),
          ),
          VerticalDivider(
            color: Colors.black.withOpacity(0.2),
            indent: 10,
            endIndent: 10,
          ),
          const CustomProfileViewRowText(
            text: 'السجل الطبي',
          ),
        ],
      ),
    );
  }
}
