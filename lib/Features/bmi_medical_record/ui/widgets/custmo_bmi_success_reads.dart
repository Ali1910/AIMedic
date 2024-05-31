import 'package:flutter/material.dart';
import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';
import 'package:gbsub/Features/bmi_medical_record/ui/widgets/custom_bmi_read_element.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_divider.dart';

class BMiGetreadsSuccessBody extends StatelessWidget {
  const BMiGetreadsSuccessBody({
    super.key,
    required this.reads,
  });
  final List<BmiReads> reads;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CustomBMIReadElement(read: reads[index]);
        },
        separatorBuilder: (context, index) {
          return const CustomDivider();
        },
        itemCount: reads.length);
  }
}
