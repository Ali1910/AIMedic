import 'package:gbsub/Features/picking_doctor_booking/data/doctor_data_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<DoctorDataModel> listOfdoctors;

  SearchSuccess({required this.listOfdoctors});
}

class SearchFailed extends SearchState {
  final String failureMessage;

  SearchFailed({required this.failureMessage});
}
