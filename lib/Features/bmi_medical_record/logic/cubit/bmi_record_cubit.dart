import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_state.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/repo/bmi_record_repo.dart';

class BmiRecordCubit extends Cubit<BmiRecordState> {
  BmiRecordCubit(this._repo) : super(BmiRecordInitial());
  final BMIRecordrepo _repo;
  Future<void> getAllReadsForUser(int id) async {
    emit(GetUserReadsLoading());
    var response = await _repo.fethcAllReadsForUser(id);

    response.fold(
      (failed) => emit(GetUserReadsFailed(error: failed.errMessage)),
      (succeeded) => emit(
        GetUserReadsSucceeded(reads: succeeded),
      ),
    );
  }

  Future<void> deleteread(int bmiId) async {
    emit(DeleteUserReadLoading());
    var response = await _repo.deleteBMI(bmiId);
    response.fold((l) {
      emit(DeleteUserReadFailed(error: l.errMessage));
    }, (r) {
      emit(DeleteUserReadSucceeded());
      getAllReadsForUser(Sharedhelper.getintdata(intkey));
    });
  }
}
