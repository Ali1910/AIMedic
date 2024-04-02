import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBodyContainer extends StatelessWidget {
  const CustomBodyContainer(
      {super.key,
      required this.text,
      required this.icon,
      required this.widget});

  final String text;
  final IconData icon;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return widget;
          }),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 25.w,
                  color: mainColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  text,
                  style: GoogleFonts.ibmPlexSansArabic(
                    textStyle: Styles.style16.copyWith(color: mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
