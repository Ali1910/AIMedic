import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_tab_bar_container.dart';

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
              widget: Text('aa'),
            ),
            Custombody(
              text: 'اعدادات NFC',
              widget: Text('aa'),
            ),
            Custombody(
              text: 'ارشادات',
              widget: Text('aa'),
            ),
            Custombody(
              text: 'سجل الحجوزات',
              widget: Text('aa'),
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
