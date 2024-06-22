import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/medication_reminder/data/medication_reminder_model.dart';
import 'package:gbsub/Features/medication_reminder/ui/medication_reminer_view_body.dart';

class MedicationReminderView extends StatelessWidget {
  const MedicationReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MainCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppbar(title: 'تذكيرات الأدوية'),
        body: const MedicationReminderViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocBuilder<MainCubit, MainStates>(
                    builder: (context, state) {
                      return Form(
                        key: of.formkey,
                        autovalidateMode: of.autovalidateMode,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextFormField(
                                  onChanged: (value) {
                                    of.steMedicationName(value);
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'هذا الحقل لا يمكن ان يكون فارغ';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.notesMedical,
                                      color: mainColor,
                                    ),
                                    hintText: 'أدخل اسم الدواء',
                                    hintStyle: Styles.style11
                                        .copyWith(color: Colors.grey),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: Styles.borderStyle(
                                      Colors.grey.withOpacity(0.5),
                                    ),
                                    focusedBorder: Styles.borderStyle(
                                      mainColor.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      SizedBox(
                                        width: 150.w,
                                        child: RadioListTile(
                                          activeColor: mainColor,
                                          title: Text('حبة',
                                              style: Styles.style16
                                                  .copyWith(color: mainColor)),
                                          groupValue:
                                              BlocProvider.of<MainCubit>(
                                                      context)
                                                  .groupvalue,
                                          onChanged: (val) {
                                            BlocProvider.of<MainCubit>(context)
                                                .setgroupvalue(val);
                                          },
                                          value: 'حبة',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: RadioListTile(
                                          activeColor: mainColor,
                                          title: Text(
                                            'شراب',
                                            style: Styles.style16
                                                .copyWith(color: mainColor),
                                          ),
                                          groupValue: of.groupvalue,
                                          onChanged: (val) {
                                            of.setgroupvalue(val);
                                          },
                                          value: 'شراب',
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    time == null
                                        ? of.setTime(of.valueOfTime)
                                        : of.setTime(
                                            "${time.hour}:${time.minute}");
                                    of.time = time!;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.w)),
                                        color: mainColor),
                                    child: Text(
                                      of.valueOfTime,
                                      style: Styles.style16
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Customelevatedbutton(
                                  text: 'أضافة',
                                  onPressed: () {
                                    if (of.formkey.currentState!.validate()) {
                                      of.addMedication(
                                          MedicationReminder(
                                              name: of.medicationname,
                                              time: of.valueOfTime,
                                              portion: "1",
                                              type: of.groupvalue!),
                                          of.time.hour,
                                          of.time.minute);
                                      of.fetchAllReminders();
                                      Navigator.pop(context);
                                    } else {
                                      of.autovalidateMode =
                                          AutovalidateMode.always;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
          },
          backgroundColor: mainColor,
          child: const Icon(
            FontAwesomeIcons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
