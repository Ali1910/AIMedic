import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';

import 'package:gbsub/Features/Login/Logic/loginstates.dart';

import 'package:gbsub/Features/Login/data/repo/login_repo.dart';

class Logincubit extends Cubit<LoginStates> {
  Logincubit(this.loginRepo) : super(LoginInitialstate());
  final LoginRepo loginRepo;

  late String email;
  late String password;
  late int id;
  bool isobscure = true;
  bool loginState = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  void showpassword() {
    isobscure = !isobscure;
    emit(ObscureChangedstate());
  }

  void onEmailfeildchanged(String x) {
    email = x;

    emit(LoginChangedstate());
  }

  void onEmialfeildsaved(String x) {
    email = x;
  }

  void onPasswordfeildchanged(String x) {
    password = x;

    emit(LoginChangedstate());
  }

  void onPasswordfeildsaved(String? x) {
    password = x!;
  }

  Future<void> login({required emial, required password}) async {
    emit(LoginLoadingState());
    var response = await loginRepo.login(email: email, password: password);
    response.fold(
      (failure) {
        emit(Loginfailed(failure.errMessage));
      },
      (success) {
        emit(LoginSuccessed());
        Sharedhelper.putIntdata(intkey, success);
        Sharedhelper.putBooldata(boolkey, true);
      },
    );
  }
}
