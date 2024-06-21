import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomReadRow extends StatelessWidget {
  const CustomReadRow({
    super.key,
    required this.read,
    required this.value,
  });
  final String read;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          read,
          style: Styles.style14
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          ' : $value',
          style: Styles.style13
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
