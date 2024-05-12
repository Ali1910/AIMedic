import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomContentElement extends StatelessWidget {
  const CustomContentElement({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Styles.styleBold16,
    );
  }
}
