import 'package:gbsub/Core/services/faliure.dart';

abstract class BmiState {}

class BMIInitialState extends BmiState {}

class BMIGenderTapped extends BmiState {}

class BMISliderSlided extends BmiState {}

class BMIIncremet extends BmiState {}

class BMIdecremet extends BmiState {}

class BMILoadingaddingValue extends BmiState {}

class BMIAddValuefailed extends BmiState {
  final String failure;

  BMIAddValuefailed({required this.failure});
}

class BMIAddValueSucceded extends BmiState {
  final bool checker;

  BMIAddValueSucceded({required this.checker});
}
