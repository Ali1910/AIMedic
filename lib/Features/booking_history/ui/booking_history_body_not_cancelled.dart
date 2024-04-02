import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/logic/booking_history_states.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/appointment_item.dart';
import 'package:gbsub/core/utilts/style.dart';

class ListOfPersonalRecord extends StatelessWidget {
  const ListOfPersonalRecord({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistroyCubit, BookingHistoryStates>(
      builder: (context, state) {
        return FutureBuilder(
          future: BookingHistroyCubit(dio: Dio())
              .getAppointMents(Sharedhelper.getintdata(intkey), false),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CustomBookingHistoryItem(
                            appointmentDateModelDTO: snapshot.data[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'لا توجد مواعيد ',
                  style: Styles.styleBold24.copyWith(color: mainColor),
                ),
              );
            }
          },
        );
      },
    );
  }
}
