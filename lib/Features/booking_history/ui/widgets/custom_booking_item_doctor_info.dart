import 'package:flutter/material.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomBookingItemDoctorInformations extends StatelessWidget {
  const CustomBookingItemDoctorInformations({
    super.key,
    required this.name,
    required this.month,
    required this.day,
    required this.year,
    required this.spec,
    required this.datatime,
  });
  final String name;
  final String month;
  final String day;
  final String year;
  final String spec;
  final String datatime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'دكتور : $name',
          style: Styles.styleBold16
              .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Text(
          'تخصص $spec',
          style: Styles.style14.copyWith(
            color: const Color(0xff616161),
          ),
        ),
        Text(
          '$year/$month/$day | $datatime',
          style: Styles.style14.copyWith(
            color: const Color(0xff616161),
          ),
        ),
      ],
    );
  }
}
