import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/bmi/presenatation/manager/BMIStates.dart';

class BMICubit extends Cubit<BMIStates> {
  BMICubit() : super(BMIInitialState());
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
}
