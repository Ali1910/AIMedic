import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/SignUp/Ui/signup_view.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تملك حساب ؟',
          style: Styles.style16,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUpView();
              }));
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'انشاء حساب',
              style:
                  Styles.styleBold16.copyWith(color: mainColor, fontSize: 13),
            ))
      ],
    );
  }
}
