import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomQuestionTabBar extends StatelessWidget {
  const CustomQuestionTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 1),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: mainColor),
            ),
          ),
          child: Text('الجميع', style: Styles.style20),
        ),
        const Spacer(),
        AnimatedContainer(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white),
            ),
          ),
          duration: const Duration(milliseconds: 1),
          child: Text('أسئلتي', style: Styles.style20),
        ),
        const Spacer(),
      ],
    );
  }
}
