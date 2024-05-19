import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/custom_question_element.dart';

class CustomListViewQuestionElement extends StatelessWidget {
  const CustomListViewQuestionElement({
    super.key,
    required this.of,
  });

  final MainCubit of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CustomQuestionElement(
            content: of.questions[index].question.content,
            gender: of.questions[index].user.gender,
            answered: of.questions[index].question.answered,
            id: of.questions[index].question.id,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5.h,
          );
        },
        itemCount: of.questions.length,
      ),
    );
  }
}
