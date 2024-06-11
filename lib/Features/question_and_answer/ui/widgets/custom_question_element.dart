import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_divider.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/custom_show_answer.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/cutom_question_gender.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomQuestionElement extends StatelessWidget {
  const CustomQuestionElement({
    super.key,
    required this.content,
    required this.gender,
    required this.answered,
    required this.id,
    required this.userid,
  });
  final String content;
  final String gender;
  final bool answered;
  final int id;
  final int userid;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: mainColor.withOpacity(0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomQuestionGender(
                gender: gender,
              ),
              userid == Sharedhelper.getintdata(intkey)
                  ? IconButton(
                      onPressed: () async {
                        var of = BlocProvider.of<MainCubit>(context);
                        bool checker = await of.deleteMyquestion(id);
                        if (!checker) {
                          if (context.mounted) {
                            customSnackBar(context, 'تأكد من الأتصال بالانترنت',
                                correctColors: false);
                          }
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.trashCan,
                        color: mainColor,
                        size: 20.w,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            content,
            style: Styles.styleBold16,
          ),
          SizedBox(
            height: 30.h,
          ),
          const CustomDivider(),
          SizedBox(
            height: 5.h,
          ),
          answered
              ? CustomDoctorAnswer(
                  id: id,
                )
              : Center(
                  child: Text(
                    'لم يتم الأجاية على السؤال بعد',
                    style: Styles.style16.copyWith(
                      color: mainColor,
                    ),
                  ),
                ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
