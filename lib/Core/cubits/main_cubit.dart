import 'dart:async';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/Home/Ui/home_body_view.dart';
import 'package:gbsub/Features/medication_reminder/data/medication_reminder_model.dart';
import 'package:gbsub/Features/medication_reminder/logic/notification_logic.dart';
import 'package:gbsub/Features/profile_page/ui/profile_view.dart';
import 'package:gbsub/Features/question_and_answer/data/question.dart';
import 'package:gbsub/Features/question_and_answer/ui/question_and_answer_view_body.dart';
import 'package:hive/hive.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());
  int currentIndex = 0;
  bool loggedin = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final dio = Dio();

  List<Widget> bottomnavigationbarviews = [
    const HomeViewBody(),
    const QuestionAndAnswerViewBody(),
    const ProfileView()
  ];

  void tapped(int index) {
    currentIndex = index;
    emit(TappedState());
  }

  void loggedInfun({bool? state}) {
    if (state != null) {
      loggedin = state;

      emit(LoggedIn());
    } else {
      loggedin = !loggedin;
      Sharedhelper.putBooldata('loggedIN', loggedin)
          .then((value) => emit(LoggedIn()));
    }
  }

  // Question and Answer cubit part

  late String question;
  List<QuestionDetails> questions = [];
  bool publicquestions = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();

  void enterQuestion(String value) {
    question = value;
    emit(QuestionEntered());
  }

  void publicquestionTapped() {
    if (publicquestions) {
    } else {
      publicquestions = true;
      emit(PublicQuestionTapped());
    }
  }

  void myquestionTapped() {
    if (!publicquestions) {
    } else {
      publicquestions = false;
      emit(Myquestionstapped());
    }
  }

  Future<bool> postQUestion(int userId) async {
    final dio = Dio();
    publicquestions = true;
    try {
      emit(FetchingQuestionLoading());
      dio.post('$baseUrl/Question?content=$question&User=$userId');
      emit(FetchingQuestionSucsess());
      return true;
    } catch (erorr) {
      emit(FetchingQuestionFailing());
      return false;
    }
  }

  Future<List<QuestionDetails>> getAllQuetions() async {
    final dio = Dio();
    questions = [];
    try {
      emit(FetchingQuestionLoading());
      var response = await dio.get('$baseUrl/Question?pagesize=10&pageNum=1');

      for (int i = 0; i < response.data['question'].length; i++) {
        QuestionDetails questionDetails = QuestionDetails.json(
            response.data['question'][i], response.data['user'][i]);

        questions.add(questionDetails);
      }
      emit(FetchingQuestionSucsess());
      return questions;
    } on Exception catch (e) {
      emit(FetchingQuestionFailing());
      return [];
    }
  }

  Future<List<QuestionDetails>> getMyQuetions() async {
    questions = [];
    try {
      emit(FetchingQuestionLoading());
      var response = await dio.get(
          '$baseUrl/Question/userQuestions?id=${Sharedhelper.getintdata(intkey)}&pagesize=10&pageNum=1');

      for (int i = 0; i < response.data['question'].length; i++) {
        QuestionDetails questionDetails = QuestionDetails.json(
            response.data['question'][i], response.data['user'][i]);

        questions.add(questionDetails);
      }
      emit(FetchingQuestionSucsess());
      return questions;
    } on Exception catch (e) {
      emit(FetchingQuestionFailing());
      return [];
    }
  }

  Future<bool> deleteMyquestion(int questionId) async {
    emit(FetchingQuestionLoading());
    try {
      await dio.delete("$baseUrl/Question?id=$questionId");
      for (var element in questions) {
        if (element.question.id == questionId) {
          questions.remove(element);
        }
        emit(FetchingQuestionSucsess());
      }
      return true;
    } catch (ex) {
      emit(FetchingQuestionFailing());
      return false;
    }
  }

  //RatingAndComment
  String? comment;
  late double ratingValue;
  Future<bool> addRating(
    int doctorId,
    int appoinmentid,
    String? comment,
    double rating,
  ) async {
    try {
      await dio.post(
          '$baseUrl/RatingAndComments?doctorid=$doctorId&appointmnetId=$appoinmentid&userId=${Sharedhelper.getintdata(intkey)}&rating=${rating.toString()}&comment=$comment');
      emit(RatingAndComment());
      return true;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
  }

  List<MedicationReminder> medications = [];
  addMedication(MedicationReminder medication, hour, minute) {
    emit(MedicationReminderAddingLoading());
    try {
      var medicationReminderBox = Hive.box<MedicationReminder>(kMedicationBox);
      medicationReminderBox.add(medication);
      setNotification(hour, minute, medication.name, medication.type);
      emit(MedicationReminderAddingSuccess());
    } on Exception catch (e) {
      emit(MedicationReminderAddingFailed());
    }
  }

  fetchAllReminders() {
    emit(MedicationReminderAddingLoading());

    medications = [];
    var medicationReminderBox = Hive.box<MedicationReminder>(kMedicationBox);
    medications = medicationReminderBox.values.toList();
    emit(MedicationReminderAddingSuccess());
  }

  String? groupvalue;
  late TimeOfDay time;
  setgroupvalue(val) {
    groupvalue = val;
    emit(InitialState());
  }

  String valueOfTime = 'قم بتحديد ميعاد اخذ الدواء';

  setTime(value) {
    valueOfTime = value;
    emit(InitialState());
  }

  late String medicationname;
  steMedicationName(value) {
    medicationname = value;
    autovalidateMode = AutovalidateMode.disabled;
    emit(InitialState());
  }
}
