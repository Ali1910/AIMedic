import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/booking_history/logic/booking_history_states.dart';

class BookingHistroyCubit extends Cubit<BookingHistoryStates> {
  BookingHistroyCubit({required this.dio})
      : super(BookingHistoryInitialState());
  final Dio dio;
  List<AppointmentDateModelDTO> listOfAppointment = [];

  Future<List<AppointmentDateModelDTO>> getAppointMents(
      int userId, bool state) async {
    try {
      listOfAppointment = [];
      var response = await dio.get(
          '$baseUrl/AppointmentContoller/GetUserAppointments?userId=$userId&state=$state');

      for (var element in response.data) {
        AppointmentDateModelDTO appointment =
            AppointmentDateModelDTO.fromjson(element);
        listOfAppointment.add(appointment);
      }
      emit(BookingHistoryDeleteState());
      return listOfAppointment;
    } catch (ex) {
      return [];
    }
  }

  Future<bool> deleteAppointments(int appointmentid) async {
    try {
      var response = await dio
          .delete('$baseUrl/AppointmentContoller?AppontmentId=$appointmentid');

      emit(BookingHistoryDeleteState());
      return response.data;
    } catch (ex) {
      return false;
    }
  }
}
