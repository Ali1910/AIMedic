import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/bmi/Ui/widgets/CustomGenderConatinerBMI.dart';
import 'package:gbsub/Features/bmi/Ui/widgets/CustomSlider.dart';
import 'package:gbsub/Features/bmi/Ui/widgets/CustomWeight&AgeContainer.dart';
import 'package:gbsub/Features/bmi/logic/cubit/bmi_cubit.dart';
import 'package:gbsub/Features/bmi/logic/cubit/bmi_state.dart';
import 'package:gbsub/Features/news/logic/news_states.dart';

class BmiViewBody extends StatelessWidget {
  const BmiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          var of = BlocProvider.of<BmiCubit>(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Text(
                      'قيمة :',
                      style: Styles.styleBold24.copyWith(color: mainColor),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      of.bmivalue,
                      style: Styles.style24.copyWith(),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomGenderContainerBMI(
                      text: 'ذكر',
                      color: of.male ? Colors.blue : mainColor,
                      onTap: () {
                        of.maletapped();
                        of.genderNotchecked = true;
                      },
                    ),
                    CustomGenderContainerBMI(
                      text: 'أنثى',
                      color: of.female ? Colors.pink : mainColor,
                      onTap: () {
                        of.femaleTapped();
                        of.genderNotchecked = true;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSlider(
                  onChanged: (v) {
                    of.sliderslided(v);
                  },
                  value: of.slidervalue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomWeightAgeConatiner(
                      text: 'حدد وزنك',
                      incrementonPressed: () {
                        of.incrementweight();
                      },
                      decrementonPressed: () {
                        of.decrementweight();
                      },
                      value: of.initialWeightValue.toString(),
                    ),
                    CustomWeightAgeConatiner(
                      text: 'حدد عمرك',
                      incrementonPressed: () {
                        of.incrementAge();
                      },
                      decrementonPressed: () {
                        of.decrementAge();
                      },
                      value: of.initialAgeValue.toString(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Customelevatedbutton(
                    text: 'احسب',
                    onPressed: () async {
                      if (of.genderChecked()) {
                        of.calculateBMI(of.initialWeightValue.toDouble(),
                            of.slidervalue.toDouble());
                        of.bmivalue = of.yourBmI.toString();
                        await of.postBMI(
                            Sharedhelper.getintdata(intkey), of.bmivalue);
                        if (state is BMILoadingaddingValue) {
                          customSnackBar(
                              context, 'يتم أضافة القيمة الي السجل الخاص بك');
                        }
                        if (state is BMIAddValuefailed) {
                          customSnackBar(context, state.failure);
                        } else {
                          customSnackBar(context, 'تم أضافة القيمة بنجاح');
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text('من فضلك حدد نوعك '),
                          ),
                        );
                      }
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
