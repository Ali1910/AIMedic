import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp(
    {required String name,
    required String phoneNumder,
    required context}) async {
  // Change the phone number and message as needed
  String phoneNumber = '+2$phoneNumder'; // Include the country code
  String message = 'أهلا دكتور $name';

  String url = "whatsapp://send?phone=$phoneNumber&text=$message";

  // Launch WhatsApp
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    customSnackBar(context, 'لا يوجد واتس اب على جهازك', duration: 2000);
  }
}
