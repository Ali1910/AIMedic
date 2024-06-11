import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_state.dart';
import 'package:image_picker/image_picker.dart';

class Covid19Cubit extends Cubit<Covid19State> {
  Covid19Cubit() : super(Covid19Initial());
  bool imagePicked = false;
  String prediction = "";
  File? selectedImage;
  bool predicted = false;
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return null;
    }
    selectedImage = File(returnedImage.path);
    imagePicked = true;
    emit(ImagePickedState());
  }

  Future<void> predictCovid() async {
    try {
      emit(Loadingstate());
      final Dio dio = Dio();
      predicted = true;
      var data = FormData.fromMap(
          {"image": await MultipartFile.fromFile(selectedImage!.path)});
      var response = await dio.post('http://10.0.2.2:5000/upload', data: data);
      if (response.data == "your result is 1 which means you have corona") {
        prediction =
            "نتيجة أشعتك هي 1 وهذا يعني أنك مصاب بكورونا يرجى متابعة الطبيب المختص";
        emit(PredicitedState());
      } else {
        prediction = "نتيجة أشعتك هي 0 وهذا يعني أنك سليم الحمد لله ";
        emit(PredicitedState());
      }
    } on Exception catch (e) {
      print(e.toString());
      predicted = true;
      emit(PredicitedState());
      prediction = "حدث خطأ ما حاول مرة اخرى";
    }
  }
}
