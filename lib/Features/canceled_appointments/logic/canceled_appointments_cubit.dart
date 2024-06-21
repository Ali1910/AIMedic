import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/canceled_appointments/logic/canceled_appointments_state.dart';
import 'package:gbsub/Features/canceled_appointments/repo/Canceled_repo.dart';
import 'package:gbsub/Features/up_coming_appointments.dart/logic/up_coming_appointments_state.dart';

class CanceledAppointmentsCubit extends Cubit<AppointmentHistory> {
  CanceledAppointmentsCubit(this._repo) : super(CanceledAppointmentsInitial());

  final CanceledRepo _repo;

  Future<void> fetchAppointments(int userid) async {
    emit(CanceledAppointmentsFetchingLoading());
    var response = await _repo.fetchCanceledAppointments(userid);
    response.fold(
      (failure) => emit(
        CanceledAppointmentsFetchingFailed(failure.errMessage),
      ),
      (success) => emit(
        CanceledAppointmentsFetchingSucceeded(success),
      ),
    );
  }
}
