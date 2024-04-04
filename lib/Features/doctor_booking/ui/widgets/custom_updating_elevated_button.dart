import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_view.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_states.dart';

class CustomUpdatingElevatedbuttom extends StatelessWidget {
  const CustomUpdatingElevatedbuttom({
    super.key,
    required this.appointmentDateModelDTO,
  });
  final AppointmentDateModelDTO appointmentDateModelDTO;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocBuilder<BookingCubit, BookingStates>(
        builder: (context, state) => state is BookingLoadingState
            ? CircularProgressIndicator(
                color: mainColor,
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  elevation: 1,
                  fixedSize: Size(
                    250.h,
                    50.w,
                  ),
                ),
                onPressed: () async {
                  var of = BlocProvider.of<BookingCubit>(context);
                  if (of.timePicked) {
                    var booked = await of.updateAppointment(
                      appointmentTime: of.appointmentTime,
                      appoinmentId: appointmentDateModelDTO.id,
                      timeId: of.timeid,
                    );
                    if (booked) {
                      customSnackBar(context, 'تم تعديل الميعاد بنجاح');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BookingHistoryView();
                          },
                        ),
                      );
                      await BlocProvider.of<BookingHistroyCubit>(context)
                          .getAppointMents(
                              Sharedhelper.getintdata(intkey), false);
                      of.getTimesForDoctor(
                        doctorid: of.doctorid,
                        year: of.year,
                        day: of.day,
                        month: of.month,
                      );
                    } else {
                      customSnackBar(context,
                          ' لا يمكن تعديل الميعاد لنفس الميعاد او تعديله لموعد تملك به ميعاد اخر');
                    }
                  } else {
                    customSnackBar(context, 'اختر ميعاد اولا');
                  }
                },
                child: Text(
                  'تعديل',
                  style: Styles.style20.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
