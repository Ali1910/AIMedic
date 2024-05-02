import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/perrsonal_details/logic/peronal_details_state.dart';

class PersonalDetailsCubit extends Cubit<PersonalDetailsStates> {
  PersonalDetailsCubit() : super(PersonalDetailsInitialState());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  late String phone;
  RegExp egyptPhoneRegExp = RegExp(r'^01[0-2]{1}[0-9]{8}$');
  void phonenumberchanged(String value) {
    phone = value;
    emit(ValueOfPhoneEnteredState());
  }
}
