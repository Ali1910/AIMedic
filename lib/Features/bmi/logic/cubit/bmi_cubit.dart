import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/bmi/logic/cubit/bmi_state.dart';
import 'package:gbsub/Features/bmi/logic/repo/bmi_repo.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit(this._repo) : super(BMIInitialState());
  final IBMIRepo _repo;
  String bmivalue = "0";
  bool male = false;
  bool female = false;
  bool genderNotchecked = false;

  bool genderChecked() {
    return genderNotchecked;
  }

  void maletapped() {
    male = true;
    female = false;
    emit(BMIGenderTapped());
  }

  void femaleTapped() {
    female = true;
    male = false;
    emit(BMIGenderTapped());
  }

  double slidervalue = 50;
  void sliderslided(double value) {
    slidervalue = value;
    emit(BMISliderSlided());
  }

  int initialWeightValue = 50;
  void incrementweight() {
    if (initialWeightValue <= 180) {
      initialWeightValue++;
      emit(BMIIncremet());
    } else {
      initialWeightValue = 180;
      emit(BMIIncremet());
    }
  }

  void decrementweight() {
    if (initialWeightValue >= 30) {
      initialWeightValue--;
      emit(BMIIncremet());
    } else {
      initialWeightValue = 30;
      emit(BMIIncremet());
    }
  }

  int initialAgeValue = 50;
  void incrementAge() {
    if (initialAgeValue <= 150) {
      initialAgeValue++;
      emit(BMIIncremet());
    } else {
      initialAgeValue = 150;
      emit(BMIIncremet());
    }
  }

  void decrementAge() {
    if (initialAgeValue >= 0) {
      initialAgeValue--;
      emit(BMIIncremet());
    } else {
      initialAgeValue = 0;
      emit(BMIIncremet());
    }
  }

  late double yourBmI;
  void calculateBMI(double weight, double height) {
    height = height / 100;
    yourBmI = weight / (height * height);
  }

  Future<void> postBMI(int userId, value) async {
    Map data = {"userid": userId, "value": value};
    emit(BMILoadingaddingValue());
    var reposne = await _repo.postBMI(data: data);
    reposne.fold(
      (failed) => emit(
        BMIAddValuefailed(
          failure: failed.errMessage,
        ),
      ),
      (r) => emit(
        BMIAddValueSucceded(checker: r),
      ),
    );
  }
}
