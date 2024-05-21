import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Features/Login/Logic/LoginCubit.dart';
import 'package:gbsub/Features/Login/Ui/login_view_body.dart';

import 'package:gbsub/Features/Login/data/repo/login_repo_impl.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Logincubit(
        LoginRepoImpl(
          aPiService: APiService(
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
              ),
            ),
          ),
        ),
      ),
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
