import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({super.key, required this.doctorid});

  final int doctorid;
  final EasyInfiniteDateTimelineController controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        var of = BlocProvider.of<BookingCubit>(context);
        of.getTimesForDoctor(
            doctorid: doctorid,
            year: selectedDate.year.toString(),
            day: selectedDate.day.toString(),
            month: selectedDate.month.toString());
      },
      locale: "ar",
      activeColor: mainColor,
      headerProps: EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.dayOnly,
        monthStyle: Styles.style16.copyWith(color: mainColor),
        selectedDateStyle: Styles.style16.copyWith(
          color: mainColor,
        ),
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          dayNumStyle: Styles.style13.copyWith(color: mainColor),
          dayStrStyle: Styles.style13.copyWith(color: mainColor),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: Styles.style16.copyWith(color: Colors.white),
          dayStrStyle: Styles.style16.copyWith(color: Colors.white),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: mainColor),
        ),
      ),
    );
  }
}
