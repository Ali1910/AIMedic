import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class FailedBody extends StatelessWidget {
  const FailedBody({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.exclamation,
          size: 60.h,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
          style: Styles.styleBold16.copyWith(color: mainColor),
        )
      ],
    );
  }
}
