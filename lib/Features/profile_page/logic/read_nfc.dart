import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
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
            dynamic checker =
                await addNFCForUser(Sharedhelper.getintdata(intkey), nfcData);
            if (checker['item1']) {
              customSnackBar(context, checker['item2'], duration: 2000);
            } else {
              customSnackBar(context, checker['item2'], duration: 2000);
            }
          } else {
            customSnackBar(context, 'حدث خطاء حاول مرة أخرى',
                correctColors: false);
          }

          await NfcManager.instance.stopSession(alertMessage: 'أنتهت الجلسة');
        },
      );
    } catch (e) {
      print(e.toString());
      customSnackBar(context, 'حدث خطاء حاول مرة أخرى', correctColors: false);
    }
  } else {
    customSnackBar(context, 'قم بتفعيل ال NFC في هاتفك', correctColors: false);
  }
}

Future<dynamic> addNFCForUser(int id, String nfc) async {
  final Dio dio = Dio();
  var response;
  try {
    response = await dio.post('$baseUrl/User/AddNFC?id=$id&NFCid=$nfc');
    return response.data;
  } on Exception catch (e) {
    print(e.toString());
    return response.data;
  }
}
