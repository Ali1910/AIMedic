import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_cubit.dart';

class CustomButtonsRow extends StatelessWidget {
  const CustomButtonsRow({
    super.key,
    required this.of,
  });

  final Covid19Cubit of;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Customelevatedbutton(
          text: 'رفع الصورة',
          onPressed: () {
            of.pickImageFromGallery();
          },
          width: 120.w,
        ),
        Customelevatedbutton(
          text: 'توقع',
          onPressed: () async {
            of.imagePicked
                ? of.predictCovid()
                : customSnackBar(context, 'اختر صورة اولا');
          },
          width: 120.w,
        ),
      ],
    );
  }
}
