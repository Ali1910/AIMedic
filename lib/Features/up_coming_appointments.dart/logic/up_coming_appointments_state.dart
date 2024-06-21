import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';

abstract class AppointmentHistory {}

final class UpComingAppointmentsInitial extends AppointmentHistory {}

final class UpComingAppointmentsFetchingLoading extends AppointmentHistory {}

final class UpComingAppointmentsFetchingSucceeded extends AppointmentHistory {
  final List<AppointmentDateModelDTO> response;

  UpComingAppointmentsFetchingSucceeded(this.response);
}

final class UpComingAppointmentsFetchingFailed extends AppointmentHistory {
  final String failure;

  UpComingAppointmentsFetchingFailed(this.failure);
}
