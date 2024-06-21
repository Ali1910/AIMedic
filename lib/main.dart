import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/networking/networking.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/Login/Ui/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedhelper.sharedPreferencesinit();
  HttpOverrides.global = MyHttpOverrides();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: "Basic_channel_group",
        channelKey: 'basicChannel',
        channelName: 'basicName',
        channelDescription: "testNoticationChannels")
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'Basic_channel_group', channelGroupName: 'basciGroup')
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MainCubit()..loggedInfun(state: Sharedhelper.loggedIN),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider.of<MainCubit>(context).loggedin
              ? const HomeView()
              : const LoginView(),
        ),
      ),
    );
  }
}
