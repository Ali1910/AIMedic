import 'dart:convert';

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
  RegExp egyptPhoneRegExp = RegExp(r'^01[0-2]{1}[0-9]{8}$');
  void phonenumberchanged(String value) {
    phone = value;
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
      print(erorr.toString());
      return erorr.toString();
    }
  }
}
