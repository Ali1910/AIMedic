import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({
    super.key,
    required this.onSubmitted,
  });
  final void Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCountainersColor),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCountainersColor),
            borderRadius: BorderRadius.circular(25)),
        fillColor: kCountainersColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: 'بحث عن أخبار',
        hintStyle: TextStyle(color: mainColor),
        prefixIcon: Icon(
          FontAwesomeIcons.searchengin,
          color: mainColor,
        ),
        isDense: true,
      ),
    );
  }
}
