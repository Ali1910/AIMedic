import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';

class AddingQuestionViewBody extends StatelessWidget {
  const AddingQuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextFormField(
              maxLines: 5,
              autofocus: true,
              style: Styles.style16.copyWith(color: Colors.black),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'هذا الحقل مطلوب';
                } else {
                  return null;
                }
              },
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintStyle: Styles.style16.copyWith(color: Colors.grey.shade400),
                hintText: 'أدخل سؤالك هنا ...',
                hintTextDirection: TextDirection.rtl,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.w)),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Spacer(),
                Customelevatedbutton(
                  text: 'نشر',
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
