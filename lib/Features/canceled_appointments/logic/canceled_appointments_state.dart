import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';

final class CanceledAppointmentsInitial extends AppointmentHistory {}

final class CanceledAppointmentsFetchingLoading extends AppointmentHistory {}

final class CanceledAppointmentsFetchingSucceeded extends AppointmentHistory {
  final List<AppointmentDateModelDTO> response;

  CanceledAppointmentsFetchingSucceeded(this.response);
}

final class CanceledAppointmentsFetchingFailed extends AppointmentHistory {
  final String failure;

  CanceledAppointmentsFetchingFailed(this.failure);
}
