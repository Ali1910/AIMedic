import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/profile_page/logic/profile_cubit.dart';
import 'package:gbsub/Features/profile_page/ui/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: ProfileViewBody(),
          ),
        ),
      ),
    );
  }
}
