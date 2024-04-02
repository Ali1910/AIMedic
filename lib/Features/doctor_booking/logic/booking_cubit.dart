import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/doctor_booking/data/Appointment_data_model_post.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_states.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitailState());

  List<AppointmentDataModel> times = [];
  List<bool> timespicked = [];
  final Dio dio = Dio();
  bool timePicked = false;
  late String appointmentTime;
  late int doctorid;
  late int timeid;

  Future<void> getTimesForDoctor({
    required int doctorid,
    required String year,
    required String day,
    required String month,
  }) async {
    if (state is BookingTimesLoadingState) {
      return null;
    }
    times = [];
    timespicked = [];
    timePicked = false;

    emit(BookingTimesLoadingState());
    var response = await dio.get(
        'https://10.0.2.2:7093/api/AppointmentContoller?doctorId=$doctorid&year=$year&month=$month&day=$day');

    for (var element in response.data) {
      AppointmentDataModel appointmentDataModel =
          AppointmentDataModel.fromjson(element);
      times.add(appointmentDataModel);
      timespicked.add(false);
    }

    emit(BookingTimesLoadingSuccessState());
  }

  Future<bool> bookAppointment(
      {required String appointmentTime,
      required int userid,
      required int doctorid,
      required int timeid}) async {
    emit(BookingLoadingState());
    try {
      await dio.post(
          'https://10.0.2.2:7093/api/AppointmentContoller?appointmentime=$appointmentTime&timeid=$timeid&UserId=$userid&doctorId=$doctorid');
      emit(BookingSucessState());
      return true;
    } catch (ex) {
      emit(BookingFailedState());
      return false;
    }
  }

  void itempicked(index) {
    if (!timespicked[index]) {
      for (int i = 0; i <= timespicked.length - 1; i++) {
        if (i == index) {
          timespicked[index] = true;
        } else {
          timespicked[i] = false;
        }
      }
      emit(BookingSucessState());
    } else {
      timespicked[index] = false;
      emit(BookingSucessState());
    }
  }
}
