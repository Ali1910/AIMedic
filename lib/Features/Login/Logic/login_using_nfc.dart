import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:nfc_manager/nfc_manager.dart';

Future<void> readNfcData(context) async {
  bool x = await NfcManager.instance.isAvailable();
  if (x) {
    String nfcData = '';
    customSnackBar(context, 'مرر كارت ال NFC');
    try {
      Future.delayed(
        const Duration(milliseconds: 500),
      );
      await NfcManager.instance.startSession(
        alertMessage: 'من فضلك مرر الكارت',
        onDiscovered: (NfcTag tag) async {
          for (var element in tag.data['nfca']['identifier']) {
            nfcData += element.toString();
          }
          if (nfcData != '') {
            customSnackBar(context, 'تم القراءة بنجاح القيمة هي $nfcData',
                duration: 2000);
            bool checker = await loginusingNFC(nfcData);
            if (checker) {
              customSnackBar(context, 'تم تسجيل الدخول بنجاح');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeView();
                  },
                ),
              );
            } else {
              customSnackBar(context, 'تأكد من البيانات المدخلة',
                  duration: 1000);
            }
          } else {
            customSnackBar(context, 'حدث خطاء حاول مرة أخرى',
                correctColors: false);
          }

          await NfcManager.instance.stopSession(alertMessage: 'أنتهت الجلسة');
        },
      );
    } catch (e) {
      customSnackBar(context, 'حدث خطاء حاول مرة أخرى', correctColors: false);
    }
  } else {
    customSnackBar(context, 'قم بتفعيل ال NFC في هاتفك', correctColors: false);
  }
}

Future<bool> loginusingNFC(String nfc) async {
  final Dio dio = Dio();
  var response;
  try {
    response = await dio.get('$baseUrl/User/LoginUsingNfc?NFC=$nfc');
    Sharedhelper.putIntdata(intkey, response.data);
    return true;
  } on Exception catch (e) {
    print(e.toString());
    return false;
  }
}
