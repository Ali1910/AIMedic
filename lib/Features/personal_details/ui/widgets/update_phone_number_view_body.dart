import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/personal_details/logic/functions/phone_number_update_method.dart';
import 'package:gbsub/Features/personal_details/logic/peronal_details_state.dart';
import 'package:gbsub/Features/personal_details/logic/personal_details_cubit.dart';
import 'package:gbsub/core/utilts/style.dart';

class UpdatePhoneNumberViewBody extends StatelessWidget {
  const UpdatePhoneNumberViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDetailsCubit, PersonalDetailsStates>(
      builder: (context, state) {
        var of = BlocProvider.of<PersonalDetailsCubit>(context);
        return Form(
          key: of.formkey,
          autovalidateMode: of.autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.w,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.phone,
                    onChanged: (p) {
                      of.phonenumberChanged(p);
                    },
                    onFieldSubmitted: (p) {
                      of.phonenumberChanged(p);
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else if (!of.egyptPhoneRegExp.hasMatch(value!)) {
                        return 'رقم الهاتف خاطئ تاكد من صحته';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'أدخل رقم هاتفك الجديد هنا',
                        hintStyle: Styles.style14.copyWith(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.w),
                            borderSide: BorderSide(color: mainColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.w),
                            borderSide: const BorderSide(color: Colors.black))),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Customelevatedbutton(
                        text: 'حفظ',
                        onPressed: () async {
                          await phoneNumberUpdateMethod(of, context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
