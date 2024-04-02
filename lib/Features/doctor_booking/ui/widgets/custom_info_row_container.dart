import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomTextRowDoctorInfo extends StatelessWidget {
  const CustomTextRowDoctorInfo({
    super.key,
    required this.value,
    required this.text,
  });

  final String value;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$text: ',
          style: Styles.style16.copyWith(
            color: mainColor,
          ),
        ),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Styles.style16.copyWith(
            color: mainColor,
          ),
        ),
      ],
    );
  }
}
