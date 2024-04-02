import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_states.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/cusomt_list_view_of_text_form_feilds.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/custom_sign_up_date_picker.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/custom_signup_city_picker_conatiner.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/custom_signup_special_condition_picker.dart';
import 'package:gbsub/Features/SignUp/Ui/Widgets/profile_picture_profile_view.dart';
import 'package:gbsub/core/utilts/style.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return Form(
          key: of.formkey,
          autovalidateMode: of.autovalidateMode,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'قم بتسجيل بياناتك',
                    style: Styles.style28.copyWith(
                        fontWeight: FontWeight.bold, color: mainColor),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'سناخذ من وقتك بضع دقائق من فضلك املئ البيانات المطلوبة بدقة لخدمة افضل',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: Styles.style14.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomProfilePictuteProfileView(
                    onTap: () async {
                      await of.pickImageFromGallery();
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomListViewOfTextForm(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomSignUpCityPickerConatiner(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomSignUpDatePickerConatiner(),
                  SizedBox(
                    height: 25.h,
                  ),
                  const CustomSignUpSpecialConditionsPickerConatiner(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Customelevatedbutton(
                    text: 'تسجيل',
                    onPressed: () async {
                      if (of.formkey.currentState!.validate()) {
                        if (of.citypicked) {
                          if (of.datepicked) {
                            if (of.specailConditionpicked) {
                              if (of.imagePicked) {
                                if (of.password == of.passwordconfirmation) {
                                  var done = await of.signup(
                                      of.specailCondition,
                                      of.city,
                                      of.dateformatted,
                                      of.email,
                                      of.fullname,
                                      of.phoneNumber,
                                      of.password,
                                      of.passwordconfirmation);
                                  if (done == 1) {
                                    customSnackBar(
                                        context, 'تم إنشاء حساب بنجاح');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const HomeView();
                                        },
                                      ),
                                    );
                                  } else if (done == 0) {
                                    customSnackBar(context,
                                        'هذا الحساب ${of.email}موجود بالفعل ');
                                  } else {
                                    customSnackBar(context,
                                        'حدث خطأ اثناء التسجيل حاول مرة أخرى');
                                  }
                                } else {
                                  customSnackBar(
                                      context, 'ـأكد من صحة كلمة السر');
                                }
                              } else {
                                customSnackBar(
                                    context, 'لا تنسى اختيار  صورة شخصية');
                              }
                            } else {
                              customSnackBar(
                                  context, 'لا تنسى اختيار حالة خاصة ان وجد');
                            }
                          } else {
                            customSnackBar(
                                context, 'لا تنسى اختيار تاريخ ميلادك');
                          }
                        } else {
                          customSnackBar(context, 'لا تنسى اختيار الميدناتك');
                        }
                      } else {
                        of.autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
