import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/Home/Data/medical_info_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMedicalInfoListView extends StatelessWidget {
  const CustomMedicalInfoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'معلومات طبية',
              style: GoogleFonts.ibmPlexSansArabic(
                textStyle: Styles.style24.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: MedicalInformation.data['bgcolor']
                          [index],
                      radius: 40.w,
                      child: Icon(
                        MedicalInformation.data['Icon'][index],
                        color: MedicalInformation.data['color'][index],
                        size: 24.w,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(MedicalInformation.data['title'][index],
                        style: Styles.style16.copyWith(color: mainColor)),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: MedicalInformation.data['title'].length),
        ),
      ],
    );
  }
}
