import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';
import 'package:gbsub/Features/SignUp/Ui/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: SignUpViewBody(),
          ),
        ),
      ),
    );
  }
}
