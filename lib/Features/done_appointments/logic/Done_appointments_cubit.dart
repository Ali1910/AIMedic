import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/done_appointments/logic/Done_appointments_state.dart';

import 'package:gbsub/Features/done_appointments/repo/Done_repo.dart';

class DoneAppointmentsCubit extends Cubit<DoneAppointmentsState> {
  DoneAppointmentsCubit(this._repo) : super(DoneAppointmentsInitial());

  final DoneRepo _repo;

  Future<void> fetchAppointments(int userid) async {
    emit(DoneAppointmentsFetchingLoading());
    var response = await _repo.fetchDoneAppointments(userid);
    response.fold(
      (failure) => emit(
        DoneAppointmentsFetchingFailed(failure.errMessage),
      ),
      (success) => emit(
        DoneAppointmentsFetchingSucceeded(success),
      ),
    );
  }
}
