import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/news/ui/news_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNewsContainer extends StatelessWidget {
  const CustomNewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const NewsView();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.newspaper,
                size: 40.w,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'الأخبار الطبية العالمية',
                style: GoogleFonts.ibmPlexSansArabic(
                    textStyle:
                        Styles.styleBold24.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
