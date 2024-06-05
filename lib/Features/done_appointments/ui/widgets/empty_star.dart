import 'package:flutter/material.dart';

class EmptyStar extends StatelessWidget {
  const EmptyStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_border,
      color: Colors.amber,
    );
  }
}
