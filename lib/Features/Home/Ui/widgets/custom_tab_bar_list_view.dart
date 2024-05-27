import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_tab_bar_container.dart';
import 'package:gbsub/Features/bmi/Ui/BMIView.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_view.dart';
import 'package:gbsub/Features/medical_advices/ui/medical_advice_view.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Custombody(
              text: 'حاسبة معدل كتلة الجسم',
              widget: BmiView(),
            ),
            Custombody(
              text: 'ارشادات',
              widget: MedicalAdviceView(),
            ),
            Custombody(
              text: 'سجل الحجوزات',
              widget: BookingHistoryView(),
            ),
            Custombody(
              text: 'السجل المرضي',
              widget: Text('aa'),
            ),
          ],
        ),
      ),
    );
  }
}
