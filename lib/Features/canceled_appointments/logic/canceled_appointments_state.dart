import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

abstract class CanceledAppointmentsState {}

final class CanceledAppointmentsInitial extends CanceledAppointmentsState {}

final class CanceledAppointmentsFetchingLoading
    extends CanceledAppointmentsState {}

final class CanceledAppointmentsFetchingSucceeded
    extends CanceledAppointmentsState {
  final List<AppointmentDateModelDTO> response;

  CanceledAppointmentsFetchingSucceeded(this.response);
}

final class CanceledAppointmentsFetchingFailed
    extends CanceledAppointmentsState {
  final String failure;

  CanceledAppointmentsFetchingFailed(this.failure);
}
