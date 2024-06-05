import 'package:flutter/material.dart';

class HalfStar extends StatelessWidget {
  const HalfStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_half,
      color: Colors.amber,
    );
  }
}
