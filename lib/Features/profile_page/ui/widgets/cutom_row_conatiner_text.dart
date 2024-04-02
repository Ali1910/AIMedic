import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomProfileViewRowText extends StatelessWidget {
  const CustomProfileViewRowText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Styles.style16.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
