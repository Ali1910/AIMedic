import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/diagnosis/logic/diagnosis_states.dart';

class DiagnosisCubit extends Cubit<DiagnosisStates> {
  DiagnosisCubit() : super(DiagnosisInitState());
  List<dynamic> listRangeOfData = [];
  List<bool> listOfBoolsForGroups = [];
  List<bool> listOfBoolsForCheckBox = [];
  int listOfDatalength = 0;
  Future<void> loadData() async {
    listRangeOfData = [];
    var rawData =
        await rootBundle.loadString('assets/files/diseasesPrediction.csv');

    List<List<dynamic>> listOfData =
        const CsvToListConverter().convert(rawData, eol: '\n');
    listOfDatalength = ((listOfData[0].length - 1) ~/ 11).toInt();
    for (var element in listOfData[0].getRange(0, listOfDatalength)) {
      listRangeOfData.add(element);
      listOfBoolsForGroups.add(false);
    }
    emit(DiagnosisSucessState());
  }

  Future<void> loadRangeOfData(start, end) async {
    listRangeOfData = [];
    listOfBoolsForCheckBox = [];
    var rawData =
        await rootBundle.loadString('assets/files/diseasesPrediction.csv');

    List<List<dynamic>> listOfData =
        const CsvToListConverter().convert(rawData, eol: '\n');
    listOfDatalength = ((listOfData[0].length - 1) ~/ 11).toInt();
    for (var element in listOfData[0].getRange(start, end)) {
      listRangeOfData.add(element);
      listOfBoolsForCheckBox.add(false);
    }
    emit(DiagnosisSucessState());
  }

  void changeGroupBools(int index) {
    for (int i = 0; i < listOfDatalength; i++) {
      if (!listOfBoolsForGroups[index]) {
        if (i == index) {
          listOfBoolsForGroups[i] = true;
          emit(DiagnosisSucessState());
        } else {
          listOfBoolsForGroups[i] = false;
          emit(DiagnosisSucessState());
        }
      } else {
        listOfBoolsForGroups[i] = false;
        emit(DiagnosisSucessState());
      }
    }
  }

  void changeCheckBools(int index) {
    if (!listOfBoolsForCheckBox[index]) {
      listOfBoolsForCheckBox[index] = true;
      emit(DiagnosisSucessState());
    } else {
      listOfBoolsForCheckBox[index] = false;
      emit(DiagnosisSucessState());
    }
  }
}
