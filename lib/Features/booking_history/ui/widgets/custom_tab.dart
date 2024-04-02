import 'package:flutter/material.dart';
import 'package:gbsub/core/utilts/style.dart';

class CystomBookingViewTap extends StatelessWidget {
  const CystomBookingViewTap({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: Styles.style16.copyWith(color: Colors.grey),
      ),
    );
  }
}
