import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBMIRecordRowOfTexts extends StatelessWidget {
  const CustomBMIRecordRowOfTexts(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.titlestyle,
      required this.subtitleStyle});
  final String title;
  final String subtitle;
  final TextStyle titlestyle;
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: titlestyle,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(subtitle, style: subtitleStyle)
      ],
    );
  }
}
