import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomGenderConatinerBMI.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomSlider.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomWeight&AgeContainer.dart';

class BmiViewBody extends StatelessWidget {
  const BmiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<MainCubit, MainStates>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGenderContainerBMI(
                    text: 'ذكر',
                    color: BlocProvider.of<MainCubit>(context).male
                        ? Colors.blue
                        : mainColor,
                    onTap: () {
                      BlocProvider.of<MainCubit>(context).maletapped();
                      BlocProvider.of<MainCubit>(context).genderNotchecked =
                          true;
                    },
                  ),
                  CustomGenderContainerBMI(
                    text: 'أنثى',
                    color: BlocProvider.of<MainCubit>(context).female
                        ? Colors.pink
                        : mainColor,
                    onTap: () {
                      BlocProvider.of<MainCubit>(context).femaleTapped();
                      BlocProvider.of<MainCubit>(context).genderNotchecked =
                          true;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSlider(
                onChanged: (v) {
                  BlocProvider.of<MainCubit>(context).sliderslided(v);
                },
                value: BlocProvider.of<MainCubit>(context).slidervalue,
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
                      BlocProvider.of<MainCubit>(context).incrementweight();
                    },
                    decrementonPressed: () {
                      BlocProvider.of<MainCubit>(context).decrementweight();
                    },
                    value: BlocProvider.of<MainCubit>(context)
                        .initialWeightValue
                        .toString(),
                  ),
                  CustomWeightAgeConatiner(
                    text: 'حدد عمرك',
                    incrementonPressed: () {
                      BlocProvider.of<MainCubit>(context).incrementAge();
                    },
                    decrementonPressed: () {
                      BlocProvider.of<MainCubit>(context).decrementAge();
                    },
                    value: BlocProvider.of<MainCubit>(context)
                        .initialAgeValue
                        .toString(),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Customelevatedbutton(
                  text: 'احسب',
                  onPressed: () {
                    if (BlocProvider.of<MainCubit>(context).genderChecked()) {
                      BlocProvider.of<MainCubit>(context).calculateBMI(
                          BlocProvider.of<MainCubit>(context)
                              .initialWeightValue
                              .toDouble(),
                          BlocProvider.of<MainCubit>(context)
                              .slidervalue
                              .toDouble());
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Text(
                                'your BMI is ${BlocProvider.of<MainCubit>(context).yourBmI.toInt().toString()}',
                                style: Styles.styleBold24
                                    .copyWith(color: mainColor),
                              ),
                            );
                          });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('من فضلك حدد نوعك ')));
                    }
                  }),
            ],
          );
        },
      ),
    );
  }
}
