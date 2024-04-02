import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationbarcubit.dart';
import 'package:gbsub/Core/networking/networking.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/Login/Ui/login_view.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedhelper.sharedPreferencesinit();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookingHistroyCubit(dio: Dio()),
        ),
        BlocProvider(
          create: (context) =>
              NavagationbarCubit()..LoggedInfun(state: Sharedhelper.loggedIN),
        ),
        BlocProvider(
          create: (context) => BookingCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider.of<NavagationbarCubit>(context).loggedin
              ? const HomeView()
              : const LoginView(),
        ),
      ),
    );
  }
}
