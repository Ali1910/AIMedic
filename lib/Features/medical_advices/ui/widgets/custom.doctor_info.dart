import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomDoctorInfo extends StatelessWidget {
  const CustomDoctorInfo({
    super.key,
    required this.doctorName,
    required this.spec,
  });
  final String doctorName;
  final String spec;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorName,
          style: Styles.style20.copyWith(fontSize: 18),
        ),
        Text(
          spec,
          style: Styles.style14.copyWith(
            color: mainColor,
          ),
        ),
      ],
    );
  }
}
