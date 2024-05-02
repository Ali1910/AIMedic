import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/perrsonal_details/logic/functions/password_update_method.dart';
import 'package:gbsub/Features/perrsonal_details/logic/peronal_details_state.dart';
import 'package:gbsub/Features/perrsonal_details/logic/personal_details_cubit.dart';
import 'package:gbsub/Features/perrsonal_details/ui/widgets/custom_password_text_form_feild.dart';

class UpdatePasswordViewBody extends StatelessWidget {
  const UpdatePasswordViewBody({super.key});

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
                  child: CutomUpdatePasswordTextFormFeild(
                    of: of,
                    onFieldSubmitted: (p) {
                      of.oldPasswordEntered(p);
                    },
                    onChanged: (p) {
                      of.oldPasswordEntered(p);
                    },
                    hinttext: 'كلمة السر القديمة ',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CutomUpdatePasswordTextFormFeild(
                    of: of,
                    onFieldSubmitted: (p) {
                      of.passwordChanged(p);
                    },
                    onChanged: (p) {
                      of.passwordChanged(p);
                    },
                    hinttext: 'كلمة السر الجديدة ',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else if (!(value!.length > 8)) {
                        return 'كلمة السر يجب أن تكون أكثر من ثمان احرق';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CutomUpdatePasswordTextFormFeild(
                    of: of,
                    onFieldSubmitted: (p) {
                      of.passwordConfirmation(p);
                    },
                    onChanged: (p) {
                      of.passwordConfirmation(p);
                    },
                    hinttext: 'تاكيد كلمة السر الجديدة ',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else if (of.newPassword != of.newPasswordConfirmation) {
                        return 'تأكد من صجة كلمة السر';
                      } else {
                        return null;
                      }
                    },
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
                          await passwordUpdateMethod(of, context);
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
