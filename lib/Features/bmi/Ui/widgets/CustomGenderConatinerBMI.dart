import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomGenderContainerBMI extends StatelessWidget {
  const CustomGenderContainerBMI({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.styleBold24.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
