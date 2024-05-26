import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_states.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());
  String specailCondition = 'امراض مزمنة';
  String city = 'مدينتك';
  String dateformatted = 'تاريخ ميلادك';
  late String email;
  late String fullname;
  late String phoneNumber;
  late String password;
  late String passwordconfirmation;
  bool citypicked = false;
  bool datepicked = false;
  bool specailConditionpicked = false;
  bool imagePicked = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  final List listOfRequiredDetails = [
    'الأسم كاملا',
    'حساب لتسجيل الدخول في المرات القادمة',
    'كلمة السر',
    'تأكيد كلمة السر',
    'رقم الهاتف'
  ];

  List<dynamic> cities = [
    'الجيزة',
    'السلام',
    'المحلة',
    'شربين',
    'المنصورة',
    'القاهرة',
    'الاسكندرية',
    'دكرنس',
    'طناح'
  ];
  List<dynamic> specialcondtion = [
    'السكر',
    'القلب',
    'الكلية',
    'الكبد',
    'لا يوجد',
  ];

  File? selectedImage;
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) {
      return null;
    }
    selectedImage = File(returnedImage.path);
    imagePicked = true;
    print(selectedImage);
    emit(ImagePickedState());
  }

  bool validatePasswordStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateNameStructure(String value) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateNUmberStructure(String value) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void validationchage() {
    autovalidateMode = AutovalidateMode.disabled;
    emit(ValueChangestate());
  }

  void datepickedfunc(DateTime d) {
    dateformatted = '${d.year} / ${d.month} / ${d.day}';
    datepicked = true;
    emit(DatePicked());
  }

  void citydropdownmenuvaluechanged(string) {
    city = string;
    citypicked = true;
    emit(Citypicked());
  }

  void specialdropdownmenuvaluechanged(string) {
    specailCondition = string;
    specailConditionpicked = true;
    emit(SpecailConditionpicked());
  }

  void onsaved(String value, int index) {
    if (index == 0) {
      fullname = value;
    } else if (index == 1) {
      email = value;
    } else if (index == 2) {
      password = value;
    } else if (index == 3) {
      passwordconfirmation = value;
    } else if (index == 4) {
      phoneNumber = value;
    }
  }

  void onchaged(String value, int index) {
    if (listOfRequiredDetails[0] == 'الأسم كاملا') {
      fullname = value;
    } else if (listOfRequiredDetails[1] ==
        'حساب لتسجيل الدخول في المرات القادمة') {
      email = value;
    } else if (listOfRequiredDetails[2] == 'كلمة السر') {
      password = value;
    } else if (listOfRequiredDetails[3] == 'تأكيد كلمة السر') {
      passwordconfirmation = value;
    } else if (listOfRequiredDetails[4] == 'رقم الهاتف') {
      phoneNumber = value;
    }
  }

  Future<int> signup(
    String specailCondition,
    String city,
    String dateformatted,
    String email,
    String fullname,
    String phoneNumber,
    String password,
    String passwordconfirmation,
  ) async {
    final Dio dio = Dio();

    var data = FormData.fromMap({
      'image': await MultipartFile.fromFile(selectedImage!.path),
      "name": fullname,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "birthDate": dateformatted,
      "specialCondition": specailCondition,
      "city": city,
      "gender": "ذكر"
    });
    try {
      var respon = await dio.post("$baseUrl/User", data: data);
      if (respon.statusCode == 200) {
        if (respon.statusCode == 200 && respon.data == "$email already eisxt") {
          return 0;
        }
        Sharedhelper.putIntdata(intkey, respon.data['id']);

        return 1;
      }
      return 2;
    } catch (ex) {
      print(ex.toString());
      return 2;
    }
  }
}
