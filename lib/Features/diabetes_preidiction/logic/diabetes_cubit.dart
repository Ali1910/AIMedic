import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/diabetes_preidiction/logic/diabetes_states.dart';

class DiabetesCubit extends Cubit<DiabetesStates> {
  DiabetesCubit() : super(DiabetesChangelState());
  double sliderInitialValue = 120.0;
  void sliderValueChanged(double value) {
    sliderInitialValue = value;
    emit(DiabetesChangelState());
  }
}
