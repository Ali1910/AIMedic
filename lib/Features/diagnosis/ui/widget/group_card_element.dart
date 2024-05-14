import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/diagnosis/logic/diagnosis_cubit.dart';
import 'package:gbsub/Features/diagnosis/logic/diagnosis_states.dart';
import 'package:gbsub/main.dart';

class GroupCardELement extends StatelessWidget {
  const GroupCardELement({
    super.key,
    required this.number,
    required this.index,
  });
  final int number;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnosisCubit, DiagnosisStates>(
      builder: (context, state) {
        var of = BlocProvider.of<DiagnosisCubit>(context);
        return Card(
          elevation: 0.5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مجموعة ${number + 1}',
                    style: Styles.style24.copyWith(color: mainColor),
                  ),
                  IconButton(
                    onPressed: () async {
                      of.changeGroupBools(index);
                      await of.loadRangeOfData(
                          (index) * 10, ((index) * 10) + 10);
                    },
                    icon: Icon(of.listOfBoolsForGroups[index]
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                  ),
                ],
              ),
              of.listOfBoolsForGroups[index]
                  ? Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        height: of.listRangeOfData.length * (20).h,
                        child: ListView.builder(
                          itemBuilder: (builder, index) {
                            return ListTile(
                              leading: Text(
                                of.listRangeOfData[index],
                                style: Styles.style16.copyWith(
                                    fontSize: 20.sp, color: mainColor),
                              ),
                              trailing: Checkbox(
                                activeColor: mainColor,
                                value: of.listOfBoolsForCheckBox[index],
                                onChanged: (b) {
                                  of.changeCheckBools(index);
                                },
                              ),
                            );
                          },
                          itemCount: of.listRangeOfData.length,
                        ),
                      ),
                    )
                  : const SizedBox(height: 0)
            ],
          ),
        );
      },
    );
  }
}
