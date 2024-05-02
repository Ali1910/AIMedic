import 'package:flutter/material.dart';
import 'package:gbsub/Features/questionandanswer/ui/widgets/adding_question_view_body.dart';

class AddingQuestionView extends StatelessWidget {
  const AddingQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: const AddingQuestionViewBody(),
      ),
    );
  }
}
