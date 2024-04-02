import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_view.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_states.dart';

class CustomBookingElevatedbuttom extends StatelessWidget {
  const CustomBookingElevatedbuttom({
    super.key,
  });

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
                    var booked = await of.bookAppointment(
                        appointmentTime: of.appointmentTime,
                        userid: Sharedhelper.getintdata(intkey),
                        doctorid: of.doctorid,
                        timeid: of.timeid);
                    if (booked) {
                      customSnackBar(context, 'تم حجز الميعاد بنجاح');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BookingHistoryView();
                          },
                        ),
                      );
                      of.getTimesForDoctor(
                          doctorid: of.doctorid,
                          year: DateTime.now().year.toString(),
                          day: DateTime.now().day.toString(),
                          month: DateTime.now().month.toString());
                    } else {
                      customSnackBar(context,
                          'أنت تملك ميعاد في نفس هذا التوقيت قم بتغير الميعاد');
                    }
                  } else {
                    customSnackBar(context, 'اختر ميعاد اولا');
                  }
                },
                child: Text(
                  'احجز',
                  style: Styles.style20.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
