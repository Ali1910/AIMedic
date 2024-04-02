import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/custom_question_element.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/custom_tab_bar.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/question_upper_body.dart';

class QuestionAndAnswerViewBody extends StatelessWidget {
  const QuestionAndAnswerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const QuestionUpperBody(),
            SizedBox(
              height: 10.h,
            ),
            const CustomQuestionTabBar(),
            SizedBox(
              height: 10.h,
            ),
            const CustomQuestionElement()
          ],
        ),
      ),
    );
  }
}
