import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomIncrementDecrementTextButton extends StatelessWidget {
  const CustomIncrementDecrementTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(color: mainColor),
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 50),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.styleBold16.copyWith(color: mainColor),
        ),
      ),
    );
  }
}
