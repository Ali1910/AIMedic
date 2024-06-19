import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_cubit.dart';
import 'package:gbsub/Features/bmi_medical_record/ui/widgets/custom_bmi_reads_row.dart';

class CustomBmiREcoredElementBody extends StatelessWidget {
  const CustomBmiREcoredElementBody({
    super.key,
    required this.read,
  });

  final BmiReads read;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomBMIRecordRowOfTexts(
        title: 'القيمة',
        subtitle: read.value,
        titlestyle: Styles.styleBold24.copyWith(color: Colors.white),
        subtitleStyle: Styles.styleBold16.copyWith(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await BlocProvider.of<BmiRecordCubit>(context).deleteread(read.id);
        },
        icon: const Icon(
          FontAwesomeIcons.trashCan,
          color: Colors.white,
          size: 30,
        ),
      ),
      subtitle: CustomBMIRecordRowOfTexts(
        title: 'تاريخ أخذ القراءة',
        subtitle:
            '${read.year}-${read.month}-${read.day} ${read.hour}:${read.minute}',
        titlestyle: Styles.style14.copyWith(color: Colors.white),
        subtitleStyle: Styles.style14.copyWith(color: Colors.white),
      ),
    );
  }
}
