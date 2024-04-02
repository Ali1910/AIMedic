import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, final String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Center(
        child: Text(
          text,
          style: Styles.style16.copyWith(color: mainColor),
        ),
      ),
      backgroundColor: Colors.white,
    ),
  );
}
