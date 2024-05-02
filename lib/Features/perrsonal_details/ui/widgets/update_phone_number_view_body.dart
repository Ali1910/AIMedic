import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/perrsonal_details/logic/peronal_details_state.dart';
import 'package:gbsub/Features/perrsonal_details/logic/personal_details_cubit.dart';
import 'package:gbsub/Features/profile_page/logic/profile_cubit.dart';
import 'package:gbsub/core/utilts/style.dart';

class UpdatePhoneNumberViewBody extends StatelessWidget {
  const UpdatePhoneNumberViewBody(
      {super.key, this.onChanged, this.onFieldSubmitted});
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

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
                      of.phonenumberchanged(p);
                    },
                    onFieldSubmitted: onFieldSubmitted,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'هذا الحقل مطلوب';
                      } else if (!of.egyptPhoneRegExp.hasMatch(value!)) {
                        return 'رقم الهاتف خاطئ تاكد من صحته';
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
                  child: Column(children: [
                    const Spacer(),
                    Customelevatedbutton(
                      text: 'حفظ',
                      onPressed: () async {
                        if (of.formkey.currentState!.validate()) {
                          await of.updatePhoneNumber();
                          if (of.result == "تم تعديل رقم الهاتف بنجاح") {
                            customSnackBar(context, of.result);
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomeView();
                            }), (Route<dynamic> route) => false);
                          } else {
                            customSnackBar(context, of.result);
                          }
                        } else {
                          of.autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
