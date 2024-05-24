import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/repo/search_repo.dart';

import 'package:gbsub/Features/search_for_doctor/logic/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getdoctors(String name, String spec) async {
    emit(SearchLoading());
    var response = await searchRepo.getDoctorByName(name, spec);
    response.fold(
      (failed) => emit(SearchFailed(failureMessage: failed.errMessage)),
      (success) => emit(
        SearchSuccess(listOfdoctors: success),
      ),
    );
  }
}
