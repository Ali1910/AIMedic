import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_states.dart';
import 'package:gbsub/Features/doctor_booking/ui/widgets/time_item_container.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomTimesListView extends StatelessWidget {
  const CustomTimesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingStates>(
      builder: (context, state) => state is BookingTimesLoadingState
          ? Center(child: CircularProgressIndicator(color: mainColor))
          : BlocProvider.of<BookingCubit>(context).times.isEmpty
              ? Center(
                  child: Text(
                  'لا يوجد مواعيد في هذا اليوم',
                  style: Styles.styleBold16,
                ))
              : SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomTimeItem(
                        appointmentDataModel:
                            BlocProvider.of<BookingCubit>(context).times[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                    itemCount:
                        BlocProvider.of<BookingCubit>(context).times.length,
                  ),
                ),
    );
  }
}
