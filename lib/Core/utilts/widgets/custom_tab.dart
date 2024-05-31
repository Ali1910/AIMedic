import 'package:flutter/material.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: Styles.style11.copyWith(color: Colors.grey),
      ),
    );
  }
}
