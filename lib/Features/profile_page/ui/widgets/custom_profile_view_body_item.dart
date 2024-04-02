import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/cutom_row_conatiner_text.dart';

class CustomProfileViewBodyItem extends StatelessWidget {
  const CustomProfileViewBodyItem(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.color,
      required this.onTap});
  final String text;
  final String imageUrl;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 66.h,
        padding: EdgeInsets.only(
          bottom: 13.h,
        ),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.w,
              backgroundColor: color.withOpacity(0.3),
              child: Image.asset(
                imageUrl,
                width: 30.w,
                height: 30.h,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            CustomProfileViewRowText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
