import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

abstract class DoneAppointmentsState {}

final class DoneAppointmentsInitial extends DoneAppointmentsState {}

final class DoneAppointmentsFetchingLoading extends DoneAppointmentsState {}

final class DoneAppointmentsFetchingSucceeded extends DoneAppointmentsState {
  final List<AppointmentDateModelDTO> response;

  DoneAppointmentsFetchingSucceeded(this.response);
}

final class DoneAppointmentsFetchingFailed extends DoneAppointmentsState {
  final String failure;

  DoneAppointmentsFetchingFailed(this.failure);
}
