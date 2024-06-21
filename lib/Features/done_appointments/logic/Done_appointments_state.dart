import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';

final class DoneAppointmentsInitial extends AppointmentHistory {}

final class DoneAppointmentsFetchingLoading extends AppointmentHistory {}

final class DoneAppointmentsFetchingSucceeded extends AppointmentHistory {
  final List<AppointmentDateModelDTO> response;

  DoneAppointmentsFetchingSucceeded(this.response);
}

final class DoneAppointmentsFetchingFailed extends AppointmentHistory {
  final String failure;

  DoneAppointmentsFetchingFailed(this.failure);
}
