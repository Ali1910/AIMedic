import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_tab.dart';
import 'package:gbsub/Features/canceled_appointments/logic/canceled_appointments_cubit.dart';
import 'package:gbsub/Features/canceled_appointments/repo/Canceled_repo_impl.dart';
import 'package:gbsub/Features/canceled_appointments/ui/canceled_appointmrnts.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_cubit.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/repo/upcoming_repo_impl.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/ui/up_coming_appointments.dart';

class BookingHistoryView extends StatelessWidget {
  const BookingHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: mainColor),
            title: Text(
              "سجل الحجوزات",
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: mainColor,
              indicatorColor: mainColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                CustomTabBar(
                  text: 'الحجوزات القادمة',
                ),
                CustomTabBar(
                  text: 'الحجوزات الملغية',
                ),
                CustomTabBar(
                  text: 'الحجوزات المنتهية',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocProvider(
                create: (context) => UpComingAppointmentsCubit(
                  UpcomingRepoImpl(
                    APiService(
                      Dio(),
                    ),
                  ),
                )..fetchAppointments(
                    Sharedhelper.getintdata(intkey),
                  ),
                child: const UpComingAppointmentsBody(),
              ),
              BlocProvider(
                create: (context) => CanceledAppointmentsCubit(
                  CanceledRepoImpl(
                    APiService(
                      Dio(),
                    ),
                  ),
                )..fetchAppointments(
                    Sharedhelper.getintdata(intkey),
                  ),
                child: const CanceledAppointmentsBody(),
              ),
              BlocProvider(
                create: (context) => CanceledAppointmentsCubit(
                  CanceledRepoImpl(
                    APiService(
                      Dio(),
                    ),
                  ),
                )..fetchAppointments(
                    Sharedhelper.getintdata(intkey),
                  ),
                child: const CanceledAppointmentsBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
