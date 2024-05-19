import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomQuestionTabBar extends StatelessWidget {
  const CustomQuestionTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        return Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (of.publicquestions) {
                } else {
                  of.publicquestionTapped();
                  await of.getAllQuetions();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: of.publicquestions ? mainColor : Colors.white),
                  ),
                ),
                child: Text('الجميع', style: Styles.style20),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (of.publicquestions) {
                  of.myquestionTapped();
                  await of.getMyQuetions();
                } else {}
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: of.publicquestions ? Colors.white : mainColor),
                  ),
                ),
                duration: const Duration(milliseconds: 1),
                child: Text('أسئلتي', style: Styles.style20),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
