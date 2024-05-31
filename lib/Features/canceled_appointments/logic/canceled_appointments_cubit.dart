import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/canceled_appointments/logic/canceled_appointments_state.dart';
import 'package:gbsub/Features/canceled_appointments/repo/Canceled_repo.dart';

class CanceledAppointmentsCubit extends Cubit<CanceledAppointmentsState> {
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
