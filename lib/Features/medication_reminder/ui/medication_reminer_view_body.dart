import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';

class MedicationReminderViewBody extends StatefulWidget {
  const MedicationReminderViewBody({super.key});

  @override
  State<MedicationReminderViewBody> createState() =>
      _MedicationReminderViewBodyState();
}

class _MedicationReminderViewBodyState
    extends State<MedicationReminderViewBody> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).fetchAllReminders();
  }

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        return of.medications.isEmpty
            ? const ScuccesEmptyBody(text: 'لا يوجد اي تذكيرات الأن')
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.w)),
                        color: mainColor),
                    child: ListTile(
                      trailing: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.white,
                      ),
                      title: Row(
                        children: [
                          Text(
                            of.medications[index].name,
                            style: Styles.styleBold16
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          of.medications[index].type == 'شراب'
                              ? Icon(
                                  FontAwesomeIcons.prescriptionBottleMedical,
                                  color: Colors.white,
                                  size: 20.w,
                                )
                              : Icon(
                                  FontAwesomeIcons.pills,
                                  color: Colors.white,
                                  size: 20.w,
                                )
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "ميعاد أخذ الدواء",
                                style: Styles.style14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ':',
                                style: Styles.style14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                of.medications[index].time,
                                style: Styles.style14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: of.medications.length,
              );
      },
    );
  }
}
