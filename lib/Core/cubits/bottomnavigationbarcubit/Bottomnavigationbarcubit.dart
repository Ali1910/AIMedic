import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/Bottomnavigationvarstates.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Features/Home/Ui/home_body_view.dart';
import 'package:gbsub/Features/profile_page/ui/profile_view.dart';
import 'package:gbsub/Features/questionandanswer/ui/question_and_answer_view_body.dart';

class NavagationbarCubit extends Cubit<BottomNavigationBarStates> {
  NavagationbarCubit() : super(InitialState());
  int currentIndex = 0;
  bool loggedin = false;
  List<Widget> bottomnavigationbarviews = [
    const HomeViewBody(),
    const HomeViewBody(),
    const QuestionAndAnswerViewBody(),
    const ProfileView()

    // const NfcViewbody(),
    // const QuestionsAnswersbdoyview(),
    // const ReportsBodyview(),
    // const ProfileViewBody(),
  ];
  void tapped(int index) {
    currentIndex = index;
    emit(TappedState());
  }

  void LoggedInfun({bool? state}) {
    if (state != null) {
      loggedin = state;

      emit(LoggedIn());
    } else {
      loggedin = !loggedin;
      Sharedhelper.putBooldata('loggedIN', loggedin)
          .then((value) => emit(LoggedIn()));
    }
  }
}
