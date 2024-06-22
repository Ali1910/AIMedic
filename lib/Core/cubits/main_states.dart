abstract class MainStates {}

class InitialState extends MainStates {}

class TappedState extends MainStates {}

class LoggedIn extends MainStates {}

class QuestionAndAnswerInitialState extends MainStates {}

class QuestionEntered extends MainStates {}

class FetchingQuestionLoading extends MainStates {}

class FetchingQuestionSucsess extends MainStates {}

class FetchingQuestionFailing extends MainStates {}

class PublicQuestionTapped extends MainStates {}

class Myquestionstapped extends MainStates {}

class RatingAndComment extends MainStates {}

final class MedicationReminderInitial extends MainStates {}

final class MedicationReminderAddingLoading extends MainStates {}

final class MedicationReminderAddingSuccess extends MainStates {}

final class MedicationReminderAddingFailed extends MainStates {}
