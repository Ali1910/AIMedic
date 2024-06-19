import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/Login/Ui/login_view.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';
import 'package:gbsub/Features/profile_page/logic/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  late ProfileModel profileModel;

  final Dio dio = Dio();
  Future<void> getprofiledetails(int id) async {
    try {
      var response = await dio.get('$baseUrl/User/GetPofileDetailes?id=$id');
      profileModel = ProfileModel.fromjson(response.data);
    } catch (ex) {}
  }

  Future<bool> updateProfilePic() async {
    File? selectedImage;
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return false;
    } else {
      selectedImage = File(returnedImage.path);
      var data = FormData.fromMap({
        'image': await MultipartFile.fromFile(selectedImage.path),
        "UserId": Sharedhelper.getintdata(intkey),
      });
      try {
        emit(ProfileImageUpdatedLoading());
        await dio.put('$baseUrl/User/UpdateProfilePic', data: data);
        emit(ProfileImageUpdatedSuccessfully());
        return true;
      } catch (ex) {
        return false;
      }
    }
  }

  Future<void> logout(context) async {
    await Sharedhelper.putBooldata(boolkey, false);
    await Sharedhelper.deleteInt(intkey);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
    );
  }
}
