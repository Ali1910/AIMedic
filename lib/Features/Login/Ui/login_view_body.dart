import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/Login/Logic/LoginCubit.dart';
import 'package:gbsub/Features/Login/Logic/loginstates.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/Login/Ui/widgets/custom_email_text_form_feild.dart';
import 'package:gbsub/Features/Login/Ui/widgets/custom_new_account_stack.dart';
import 'package:gbsub/Features/Login/Ui/widgets/custom_password_text_form_feild.dart';
import 'package:gbsub/Features/Login/Ui/widgets/custom_text_button.dart';
import 'package:gbsub/core/utilts/style.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Logincubit, LoginStates>(
      builder: (context, state) {
        var of = BlocProvider.of<Logincubit>(context);
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
                    'اهلا بعودتك',
                    style: Styles.style28.copyWith(
                        fontWeight: FontWeight.bold, color: mainColor),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'اهلا بعودتك الينا نحن متحمسون لمساعدتك على الاهتمام بصحتك حافظ عليها لانها اغلى ما تملك',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: Styles.style14.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomEmailTextFormFeild(
                    onChanged: (x) {
                      of.onEmailfeildchanged(x);
                    },
                    onSaved: (x) {
                      of.onEmailfeildchanged(x!);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPasswordTextFormFeild(
                    onChanged: (p0) {
                      of.onPasswordfeildchanged(p0);
                    },
                    onSaved: (p0) {
                      of.onPasswordfeildsaved(p0);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  state is LoginLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                          color: mainColor,
                        ))
                      : Customelevatedbutton(
                          text: 'تسجيل الدخول',
                          onPressed: () async {
                            if (of.formkey.currentState!.validate()) {
                              var bool = await of.login(Dio());
                              if (bool) {
                                customSnackBar(
                                    context, 'تم ستجيل الدخول بنجاح اهلا بك');
                                Sharedhelper.putBooldata(boolkey, true);
                                Sharedhelper.putIntdata(intkey, of.id);

                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeView();
                                    },
                                  ),
                                );
                              } else {
                                customSnackBar(context,
                                    'خطأ في تسجيل الدخول حاول مرة وتأكد من صحة كلمة السر والايميل');
                              }
                            } else {
                              of.autovalidateMode = AutovalidateMode.always;
                            }
                          },
                        ),
                  SizedBox(
                    height: 50.h,
                  ),
                  const CreateNewAccountStack(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const CustomTextButton()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
