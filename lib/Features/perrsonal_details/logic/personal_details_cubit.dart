import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/perrsonal_details/logic/peronal_details_state.dart';

class PersonalDetailsCubit extends Cubit<PersonalDetailsStates> {
  PersonalDetailsCubit() : super(PersonalDetailsInitialState());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  late String phone;
  late String result;
  late String newPassword;
  late String oldPassword;
  late String newPasswordConfirmation;
  RegExp egyptPhoneRegExp = RegExp(r'^01[0-2]{1}[0-9]{8}$');
  void phonenumberChanged(String value) {
    phone = value;
    emit(ValueOfPhoneEnteredState());
  }

  void passwordChanged(String value) {
    newPassword = value;
    emit(ValueOfPhoneEnteredState());
  }

  void oldPasswordEntered(String value) {
    oldPassword = value;
    emit(ValueOfPhoneEnteredState());
  }

  void passwordConfirmation(String value) {
    newPasswordConfirmation = value;
    emit(ValueOfPhoneEnteredState());
  }

  Future<String> updatePhoneNumber() async {
    final dio = Dio();
    try {
      var response = await dio.put(
          '$baseUrl/User/updatePhoneNumber?id=${Sharedhelper.getintdata(intkey)}&newPhoneNumber=$phone');
      result = response.data;
      return result;
    } catch (erorr) {
      return erorr.toString();
    }
  }

  Future<String> updatePassword() async {
    final dio = Dio();
    try {
      var response = await dio.put(
          '$baseUrl/User/updatePassword?id=${Sharedhelper.getintdata(intkey)}&oldpassword=$oldPassword&newpassword=$newPassword');
      result = response.data;
      return result;
    } catch (erorr) {
      return erorr.toString();
    }
  }
}
