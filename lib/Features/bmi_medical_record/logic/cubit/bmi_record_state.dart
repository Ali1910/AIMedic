import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';

abstract class BmiRecordState {}

final class BmiRecordInitial extends BmiRecordState {}

final class GetUserReadsLoading extends BmiRecordState {}

final class GetUserReadsSucceeded extends BmiRecordState {
  final List<BmiReads> reads;

  GetUserReadsSucceeded({required this.reads});
}

final class GetUserReadsFailed extends BmiRecordState {
  final String error;

  GetUserReadsFailed({required this.error});
}

final class DeleteUserReadLoading extends BmiRecordState {}

final class DeleteUserReadSucceeded extends BmiRecordState {}

final class DeleteUserReadFailed extends BmiRecordState {
  final String error;

  DeleteUserReadFailed({required this.error});
}
