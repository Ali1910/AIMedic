import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class MedicalInformation {
  static Map data = {
    'title': ['موسوعة الادوية', 'الأمراض', 'العمليات الجراحية'],
    'Icon': [
      FontAwesomeIcons.capsules,
      FontAwesomeIcons.disease,
      FontAwesomeIcons.userInjured
    ],
    'color': [Colors.purple, mainColor, Colors.red],
    'bgcolor': [
      Colors.purple.withOpacity(0.1),
      mainColor.withOpacity(0.1),
      Colors.red.withOpacity(0.1)
    ],
  };
}
