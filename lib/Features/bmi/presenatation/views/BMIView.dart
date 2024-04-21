import 'package:flutter/material.dart';

import 'package:gbsub/Features/bmi/presenatation/views/BMIViewBody.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomAppbar.dart';

class BmiView extends StatelessWidget {
  const BmiView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(title: 'حاسبة معدل كتلة الجسم'),
        body: BmiViewBody(),
      ),
    );
  }
}
