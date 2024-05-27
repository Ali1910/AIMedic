import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final Function(double) onChanged;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'حدد طولك :',
            style: Styles.styleBold24.copyWith(color: mainColor),
          ),
          Slider(
            value: value,
            onChanged: onChanged,
            min: 0,
            max: 250,
            activeColor: mainColor,
          ),
          Text(
            'القيمة : ${value.toInt()}سم',
            style: Styles.styleBold24.copyWith(color: mainColor),
          ),
        ],
      ),
    );
  }
}
