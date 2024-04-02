import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_body_contatiner.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomServiceRowCustomBodyContinerListView extends StatelessWidget {
  const CustomServiceRowCustomBodyContinerListView({
    super.key,
    required this.text1,
    required this.icon1,
    required this.text2,
    required this.icon2,
    required this.text3,
    required this.icon3,
    required this.mainText,
    required this.widget1,
    required this.widget2,
    required this.widget3,
  });
  final String mainText;
  final String text1;
  final IconData icon1;
  final String text2;
  final IconData icon2;
  final String text3;
  final IconData icon3;
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              mainText,
              style: GoogleFonts.ibmPlexSansArabic(
                  textStyle: Styles.style24.copyWith(color: Colors.black)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBodyContainer(icon: icon1, text: text1, widget: widget1),
              CustomBodyContainer(icon: icon2, text: text2, widget: widget2),
              CustomBodyContainer(
                icon: icon3,
                text: text3,
                widget: widget3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
