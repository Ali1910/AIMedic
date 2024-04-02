import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/Login/Logic/LoginCubit.dart';
import 'package:gbsub/Features/Login/Ui/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Logincubit(),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
