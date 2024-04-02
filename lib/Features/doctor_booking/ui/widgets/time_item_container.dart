import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/data/Appointment_data_model_post.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_states.dart';

class CustomTimeItem extends StatelessWidget {
  const CustomTimeItem({
    super.key,
    required this.appointmentDataModel,
    required this.index,
  });
  final AppointmentDataModel appointmentDataModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingStates>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: appointmentDataModel.empty
              ? () {
                  var of = BlocProvider.of<BookingCubit>(context);
                  of.itempicked(index);
                  of.timePicked = of.timespicked[index];

                  of.appointmentTime = appointmentDataModel.datetime;
                  of.timeid = appointmentDataModel.timeId;
                  of.doctorid = appointmentDataModel.doctorId;
                }
              : BlocProvider.of<BookingCubit>(context).yourApponitment[index]
                  ? () {
                      var of = BlocProvider.of<BookingCubit>(context);
                      of.itempicked(index);
                      of.timePicked = false;
                    }
                  : null,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(120.w, 50.h),
            backgroundColor:
                BlocProvider.of<BookingCubit>(context).yourApponitment[index]
                    ? Colors.red
                    : BlocProvider.of<BookingCubit>(context).timespicked[index]
                        ? mainColor
                        : Colors.white,
            side: appointmentDataModel.empty
                ? BorderSide(
                    color: BlocProvider.of<BookingCubit>(context)
                            .timespicked[index]
                        ? Colors.white
                        : mainColor)
                : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w)),
          ),
          child: Text(
            appointmentDataModel.datetime,
            style: Styles.styleBold16.copyWith(
              color:
                  BlocProvider.of<BookingCubit>(context).yourApponitment[index]
                      ? Colors.white
                      : appointmentDataModel.empty
                          ? BlocProvider.of<BookingCubit>(context)
                                  .timespicked[index]
                              ? Colors.white
                              : mainColor
                          : Colors.grey.shade600,
            ),
          ),
        );
      },
    );
  }
}
