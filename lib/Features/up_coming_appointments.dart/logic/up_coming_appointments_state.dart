import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

abstract class UpComingAppointmentsState {}

final class UpComingAppointmentsInitial extends UpComingAppointmentsState {}

final class UpComingAppointmentsFetchingLoading
    extends UpComingAppointmentsState {}

final class UpComingAppointmentsFetchingSucceeded
    extends UpComingAppointmentsState {
  final List<AppointmentDateModelDTO> response;

  UpComingAppointmentsFetchingSucceeded(this.response);
}

final class UpComingAppointmentsFetchingFailed
    extends UpComingAppointmentsState {
  final String failure;

  UpComingAppointmentsFetchingFailed(this.failure);
}
