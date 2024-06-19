import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/syptoms/data/symptoms_model.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_states.dart';

class SyptomsCubit extends Cubit<SyptomsStates> {
  SyptomsCubit() : super(SyptomsInitState());
  List<Symptoms> listOfSymptoms = [];
  List<bool> listOfBools = [];
  bool predicted = false;
  final dio = Dio();
  late String prediction;

  Future<List<Symptoms>> getSyptoms() async {
    try {
      listOfSymptoms = [];
      listOfBools = [];
      var response = await dio.get('$baseUrl/Syptoms');
      for (var element in response.data) {
        Symptoms symptoms = Symptoms.json(element);
        listOfSymptoms.add(symptoms);
        listOfBools.add(false);
      }
      return listOfSymptoms;
    } on Exception catch (e) {
      return [];
    }
  }

  Future<void> getPrediction() async {
    try {
      var response = await dio.post('http://10.0.2.2:5000/predict', data: data);
      prediction = response.data;
      predicted = true;
      emit(SyptomsSucessState());
    } catch (ex) {}
  }

  void chageBool(index, key) {
    listOfBools[index] = !listOfBools[index];
    if (listOfBools[index]) {
      data[key] = 1;
    } else {
      data[key] = 0;
    }
    emit(SyptomsSucessState());
  }

  var data = {
    "itching": 0,
    "skin_rash": 0,
    "nodal_skin_eruptions": 0,
    "continuous_sneezing": 0,
    "shivering": 0,
    "chills": 0,
    "joint_pain": 0,
    "stomach_pain": 0,
    "acidity": 0,
    "ulcers_on_tongue": 0,
    "muscle_wasting": 0,
    "vomiting": 0,
    "burning_micturition": 0,
    "spotting_urination": 0,
    "fatigue": 0,
    "weight_gain": 0,
    "anxiety": 0,
    "cold_hands_and_feets": 0,
    "mood_swings": 0,
    "weight_loss": 0,
    "restlessness": 0,
    "lethargy": 0,
    "patches_in_throat": 0,
    "irregular_sugar_level": 0,
    "cough": 0,
    "high_fever": 0,
    "sunken_eyes": 0,
    "breathlessness": 0,
    "sweating": 0,
    "dehydration": 0,
    "indigestion": 0,
    "headache": 0,
    "yellowish_skin": 0,
    "dark_urine": 0,
    "nausea": 0,
    "loss_of_appetite": 0,
    "pain_behind_the_eyes": 0,
    "back_pain": 0,
    "constipation": 0,
    "abdominal_pain": 0,
    "diarrhoea": 0,
    "mild_fever": 0,
    "yellow_urine": 0,
    "yellowing_of_eyes": 0,
    "acute_liver_failure": 0,
    "fluid_overload": 0,
    "swelling_of_stomach": 0,
    "swelled_lymph_nodes": 0,
    "malaise": 0,
    "blurred_and_distorted_vision": 0,
    "phlegm": 0,
    "throat_irritation": 0,
    "redness_of_eyes": 0,
    "sinus_pressure": 0,
    "runny_nose": 0,
    "congestion": 0,
    "chest_pain": 0,
    "weakness_in_limbs": 0,
    "fast_heart_rate": 0,
    "pain_during_bowel_movements": 0,
    "pain_in_anal_region": 0,
    "bloody_stool": 0,
    "irritation_in_anus": 0,
    "neck_pain": 0,
    "dizziness": 0,
    "cramps": 0,
    "bruising": 0,
    "obesity": 0,
    "swollen_legs": 0,
    "swollen_blood_vessels": 0,
    "puffy_face_and_eyes": 0,
    "enlarged_thyroid": 0,
    "brittle_nails": 0,
    "swollen_extremeties": 0,
    "excessive_hunger": 0,
    "extra_marital_contacts": 0,
    "drying_and_tingling_lips": 0,
    "slurred_speech": 0,
    "knee_pain": 0,
    "hip_joint_pain": 0,
    "muscle_weakness": 0,
    "stiff_neck": 0,
    "swelling_joints": 0,
    "movement_stiffness": 0,
    "spinning_movements": 0,
    "loss_of_balance": 0,
    "unsteadiness": 0,
    "weakness_of_one_body_side": 0,
    "loss_of_smell": 0,
    "bladder_discomfort": 0,
    "foul_smell_of_urine": 0,
    "continuous_feel_of_urine": 0,
    "passage_of_gases": 0,
    "internal_itching": 0,
    "toxic_look_(typhos)": 0,
    "depression": 0,
    "irritability": 0,
    "muscle_pain": 0,
    "altered_sensorium": 0,
    "red_spots_over_body": 0,
    "belly_pain": 0,
    "abnormal_menstruation": 0,
    "dischromic_patches": 0,
    "watering_from_eyes": 0,
    "increased_appetite": 0,
    "polyuria": 0,
    "family_history": 0,
    "mucoid_sputum": 0,
    "rusty_sputum": 0,
    "lack_of_concentration": 0,
    "visual_disturbances": 0,
    "receiving_blood_transfusion": 0,
    "receiving_unsterile_injections": 0,
    "coma": 0,
    "stomach_bleeding": 0,
    "distention_of_abdomen": 0,
    "history_of_alcohol_consumption": 0,
    "fluid_overload.1": 0,
    "blood_in_sputum": 0,
    "prominent_veins_on_calf": 0,
    "palpitations": 0,
    "painful_walking": 0,
    "pus_filled_pimples": 0,
    "blackheads": 0,
    "scurring": 0,
    "skin_peeling": 0,
    "silver_like_dusting": 0,
    "small_dents_in_nails": 0,
    "inflammatory_nails": 0,
    "blister": 0,
    "red_sore_around_nose": 0,
    "yellow_crust_ooze": 0
  };
}
